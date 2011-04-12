class CreatePapers < ActiveRecord::Migration
  def self.up
    create_table :papers do |t|
      t.string :name
      t.string :file
      t.integer :project_id
      t.string :password_hash
      t.string :password_salt
      
      t.timestamps
    end
  end

  def self.down
    drop_table :papers
  end
end
