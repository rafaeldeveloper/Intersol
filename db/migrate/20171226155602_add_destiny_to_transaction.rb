class AddDestinyToTransaction < ActiveRecord::Migration[5.0]
  def change
		add_column :transactions, :recipient, :integer
 end
end
