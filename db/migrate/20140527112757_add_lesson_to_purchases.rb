class AddLessonToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :lesson_id, :integer
  end
end
