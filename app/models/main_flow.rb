class MainFlow < ActiveRecord::Base
  attr_accessible :description, :use_case_id, :alternate_flow_id

  has_many :sub_flows
  has_many :alternate_flows
  has_one :use_case

  validates :description, presence: true
end