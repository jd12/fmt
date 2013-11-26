class UseCase < ActiveRecord::Base
  attr_accessible :name, :description, :precondition_id, :main_flow_id, :sub_flow_id, :alternate_flow_id, :preconditions_attributes, :main_flows_attributes, :sub_flows_attributes, :alternate_flows_attributes

  belongs_to :requirements_document
  has_many :preconditions, dependent: :destroy
  has_many :main_flows, dependent: :destroy
  has_many :sub_flows, dependent: :destroy
  has_many :alternate_flows, dependent: :destroy

  accepts_nested_attributes_for :preconditions, :main_flows, :sub_flows, :alternate_flows

  validates :name, presence: true
end