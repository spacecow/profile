class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :title
      t.string :subtitle
      t.string :type
      t.integer :page_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
