class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.belongs_to :category

      t.timestamps
    end
    add_index :books, :category_id
  end
end

