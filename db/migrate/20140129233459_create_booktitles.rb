class CreateBooktitles < ActiveRecord::Migration
  def change
    create_table :booktitles do |t|

      t.timestamps
    end
    add_index :booktitles, :category_id
  end
end
