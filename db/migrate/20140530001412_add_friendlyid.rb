class AddFriendlyid < ActiveRecord::Migration
  def change
    add_column :books, :slug, :string
    add_column :categories, :slug, :string
    add_index :books, :slug, unique: true
    add_index :categories, :slug, unique: true
  end
end
