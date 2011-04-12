class AddImageToSection < ActiveRecord::Migration
  def self.up
    add_column :sections, :image, :string
  end

  def self.down
    remove_column :sections, :image
  end
end
