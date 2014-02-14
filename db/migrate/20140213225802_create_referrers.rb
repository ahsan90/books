class CreateReferrers < ActiveRecord::Migration
  def change
    create_table :referrers do |t|
      t.string :code
      t.string :name
      t.string :email
      t.timestamps

    end
    add_column :purchases, :referrer_id, :integer
  end
end
