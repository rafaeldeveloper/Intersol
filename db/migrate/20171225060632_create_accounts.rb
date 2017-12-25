class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :agency, foreign_key: true
      t.string :conta
      t.decimal :limite

      t.timestamps
    end
  end
end
