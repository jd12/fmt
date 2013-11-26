class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :role_id

      t.timestamps
    end
  end
end