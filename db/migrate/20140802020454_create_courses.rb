class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :public
      t.text :description

      t.timestamps
    end
  end
end
