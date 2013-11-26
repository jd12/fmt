class Project < ActiveRecord::Base
  attr_accessible :is_active, :name, :roles, :roles_attributes

  validates :name, presence: true

  has_many :users, through: :roles
  has_many :roles, dependent: :destroy
  has_one :requirements_document, dependent: :destroy

  accepts_nested_attributes_for :roles, reject_if: proc { |attributes| attributes[:user_id].blank? }

  # Print current user's role for the specified project
  def role_for_user(user)
    user.roles.where(:project_id => self.id).first.try(:print_role)
  end

end