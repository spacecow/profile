class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.name :string
      t.integer :project_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
