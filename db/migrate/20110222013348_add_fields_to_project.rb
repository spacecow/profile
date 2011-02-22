class AddFieldsToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :title, :string
    add_column :projects, :subtitle, :string
  end

  def self.down
    remove_column :projects, :subtitle
    remove_column :projects, :title
  end
end
