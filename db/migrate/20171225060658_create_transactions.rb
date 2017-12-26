class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :accounts, foreign_key: true
      t.decimal :valor
      t.string :tipo
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
