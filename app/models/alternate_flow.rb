class AlternateFlow < ActiveRecord::Base
  attr_accessible :description, :use_case_id, :main_flow_id, :sub_flow_id

  has_one :use_case
  has_one :main_flow
  has_one :sub_flow

end