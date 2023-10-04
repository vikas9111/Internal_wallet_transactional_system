require 'latest_stock_price'
class Stock < ApplicationRecord
  belongs_to :user
  has_one :stock_wallet, dependent: :destroy
  has_many :transactions
  after_create :create_stock_wallet

  def self.available_stocks(stock_identifier: nil)
    latest_stock = LatestStockPrice.new
    latest_stock.fetch_available_stocks(identifier: stock_identifier)
  end
end
