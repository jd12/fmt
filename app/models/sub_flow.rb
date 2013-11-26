class SubFlow < ActiveRecord::Base
  attr_accessible :description, :use_case_id, :main_flow_id, :alternate_flow_id

  has_many :alternate_flows
  has_one :use_case
  has_one :main_flow

  validates :description, presence: true
end