class AddAtarToBooktitles < ActiveRecord::Migration
  def change
    change_table :booktitles do |t|
      t.float :atar
      t.float :price
    end
  end
end
