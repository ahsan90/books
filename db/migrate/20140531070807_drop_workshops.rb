class DropWorkshops < ActiveRecord::Migration
  def up
    drop_table :workshops
  end

  def down
    create_table :workshops do |t|
      t.string :title
      t.text :body
      t.float :atar
      t.float :price
      t.string :file
      t.string :preview
      t.string :display

      t.timestamps
    end
  end
end
