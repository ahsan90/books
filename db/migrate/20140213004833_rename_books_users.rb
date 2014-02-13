class RenameBooksUsers < ActiveRecord::Migration
  def change
    rename_table :books_users, :purchases
  end
end
