class CreateUseCases < ActiveRecord::Migration
  def change
    create_table :use_cases do |t|
      t.string :name
      t.integer :requirements_document_id
      t.integer :precondition_id
      t.integer :main_flow_id
      t.integer :sub_flow_id
      t.integer :alternate_flow_id

      t.timestamps
    end
  end
end