class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :roles_attributes

  validates :name, presence: true

  has_many :projects, through: :roles
  has_many :roles, dependent: :destroy
  accepts_nested_attributes_for :roles

  # Does user have a certain role?
  def self.for_role(role)
    where('roles.role_id' => role)
  end

  # Users who do not have any projects assigned
  def self.without_projects
    User.all.delete_if { |u| Role.where(:user_id => u.id).present? }
  end

  # Find users who are not already assigned to the given project
  def self.unassigned_to(project)
    User.all.delete_if { |u| project.users.include?(u) }
  end
end