class CreateSubFlows < ActiveRecord::Migration
  def change
    create_table :sub_flows do |t|
      t.text :description
      t.integer :use_case_id
      t.integer :main_flow_id
      t.integer :alternate_flow_id

      t.timestamps
    end
  end
end