class RequirementsDocument < ActiveRecord::Base
  attr_accessible :name, :project_id

  belongs_to :project
  has_many :use_cases

end