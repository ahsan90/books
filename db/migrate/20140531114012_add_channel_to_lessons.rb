class AddChannelToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :channel, :string
  end
end
