class CreatePreconditions < ActiveRecord::Migration
  def change
    create_table :preconditions do |t|
      t.text :description
      t.integer :use_case_id

      t.timestamps
    end
  end
end