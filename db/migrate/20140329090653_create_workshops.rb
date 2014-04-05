class CreateWorkshops < ActiveRecord::Migration
  def change
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
