class CreateUserManagers < ActiveRecord::Migration
  def change
    create_table :user_managers do |t|

      t.timestamps
    end
  end
end
