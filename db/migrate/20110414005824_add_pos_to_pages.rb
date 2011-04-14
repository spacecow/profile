class AddPosToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :pos, :integer
  end

  def self.down
    remove_column :pages, :pos
  end
end
