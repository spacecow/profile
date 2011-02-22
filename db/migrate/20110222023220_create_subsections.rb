class CreateSubsections < ActiveRecord::Migration
  def self.up
    create_table :subsections do |t|
      t.text :content
      t.integer :section_id
      t.string :type
      
      t.timestamps
    end
  end

  def self.down
    drop_table :subsections
  end
end
