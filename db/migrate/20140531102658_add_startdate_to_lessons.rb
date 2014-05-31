class AddStartdateToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :startdate, :string
  end
end
