class AddBalanceToAccounts < ActiveRecord::Migration[5.0]
   def change
    add_column :accounts, :balance, :decimal
  end
end
