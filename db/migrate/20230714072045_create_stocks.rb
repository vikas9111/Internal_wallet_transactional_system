class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :stock_identifier
      t.references :user
      

      t.timestamps
    end
  end
end
