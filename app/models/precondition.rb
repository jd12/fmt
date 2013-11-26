class Precondition < ActiveRecord::Base
  attr_accessible :description, :use_case_id

  has_one :use_case

  validates :description, presence: true
end
