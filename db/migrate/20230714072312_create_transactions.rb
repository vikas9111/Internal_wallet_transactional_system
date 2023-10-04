class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :source_wallet_id
      t.integer :target_wallet_id
      t.integer :amount
      t.string :transaction_type

      t.timestamps
    end
  end
end
