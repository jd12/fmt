class DeviseCreateAdministrators < ActiveRecord::Migration
  def change
    create_table(:administrators) do |t|
      ## Database authenticatable
      t.string :name, :null => false
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.timestamps
    end
  end
end
