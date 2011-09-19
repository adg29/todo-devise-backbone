class AddDoneDescripionOrderUserIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :done, :boolean
    add_column :projects, :description, :text
    add_column :projects, :order, :integer
    add_column :projects, :user_id, :integer
  end

  def self.down
    remove_column :projects, :user_id
    remove_column :projects, :order
    remove_column :projects, :description
    remove_column :projects, :done
  end
end
