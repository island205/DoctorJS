class AddItemsToProject < ActiveRecord::Migration
  def change
     add_column :projects, :project_id, :string
     add_column :projects, :name, :string
     add_column :projects, :url, :string
  end
end
