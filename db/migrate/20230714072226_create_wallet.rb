class CreateWallet < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string  :type
      t.integer :balance, default: 0
      t.integer :user_id
      t.integer :stock_id
      t.timestamps
    end
  end
end
