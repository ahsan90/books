class AddAtarToBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.float :atar
      t.float :price
    end
  end
end
