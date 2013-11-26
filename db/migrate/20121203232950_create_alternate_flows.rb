class CreateAlternateFlows < ActiveRecord::Migration
  def change
    create_table :alternate_flows do |t|
      t.text :description
      t.integer :use_case_id
      t.integer :main_flow_id
      t.integer :sub_flow_id

      t.timestamps
    end
  end
end