class CreateBooktitles < ActiveRecord::Migration
  def change
    create_table :booktitles do |t|
      t.string :title
      t.text :body
      t.belongs_to :category

      t.timestamps
    end
    add_index :booktitles, :category_id
  end
end

