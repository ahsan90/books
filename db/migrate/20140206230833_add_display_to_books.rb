class AddDisplayToBooks < ActiveRecord::Migration
  def change
    add_column :books, :display, :string
  end
end
