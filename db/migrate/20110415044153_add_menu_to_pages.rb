class AddMenuToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :menu, :string
  end

  def self.down
    remove_column :pages, :menu
  end
end
