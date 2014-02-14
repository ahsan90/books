class AddSaledateToBooksPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :saledate, :datetime
  end
end
