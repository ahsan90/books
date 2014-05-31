class AddDetailsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :duration, :string
    add_column :lessons, :minutes, :float
    add_column :lessons, :days, :string
    add_column :lessons, :frequency, :string
  end
end
