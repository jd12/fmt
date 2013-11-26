class CreateUserManagements < ActiveRecord::Migration
  def change
    create_table :user_managements do |t|

      t.timestamps
    end
  end
end
