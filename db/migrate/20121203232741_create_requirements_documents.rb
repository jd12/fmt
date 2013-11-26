class CreateRequirementsDocuments < ActiveRecord::Migration
  def change
    create_table :requirements_documents do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end