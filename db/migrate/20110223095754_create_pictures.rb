class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :image
      t.string :caption
      t.integer :project_id
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
