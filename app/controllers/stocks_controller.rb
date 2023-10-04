class StocksController < ApplicationController
  before_action :authenticate_user

  def available_stocks
    render json: { stocks: Stock.available_stocks(stock_identifier: params['stock_identifier']) }
  end

  def purchase_stock
    available_stock = Stock.available_stocks(stock_identifier: params['stock_identifier'])&.first
    if params['stock_identifier'].nil?
      render json: { error: "please provide stock_identifier"}
    elsif params['quantity'].nil?
      render json: { error: "please provide quantity"}
    elsif available_stock['lastPrice'] * params['quantity'].to_i > @user.user_wallet.balance
      render json: { error: "Insufficient funds"}
    elsif available_stock.present?
      if stock = @user.stocks.find_or_create_by(name: available_stock['symbol'], stock_identifier: available_stock['identifier'])
        transaction_amount = available_stock['lastPrice'] * params['quantity'].to_i
        stock.stock_wallet.update(balance: stock.stock_wallet.balance + params['quantity'].to_i)
        @user.user_wallet.update(balance: @user.user_wallet.balance - transaction_amount)
        Transaction.create(source_wallet_id: @user.user_wallet.id, target_wallet_id: stock.stock_wallet.id, amount: transaction_amount)
      end
    end
  end

  def sale_stock
    available_stock = Stock.available_stocks(stock_identifier: params['stock_identifier'])&.first
    if params['stock_identifier'].nil?
      render json: { error: "please provide stock_identifier"}
    elsif params['quantity'].nil?
      render json: { error: "please provide quantity"}
    elsif available_stock.present?
      stock = @user.stocks.find_by(stock_identifier: available_stock['identifier'])

      if stock && stock.stock_wallet.balance > params['quantity'].to_i
        transaction_amount = available_stock['lastPrice'] * params['quantity'].to_i
        stock.stock_wallet.update(balance: stock.stock_wallet.balance - params['quantity'].to_i)
        @user.user_wallet.update(balance: @user.user_wallet.balance + transaction_amount)
        Transaction.create(source_wallet_id: stock.stock_wallet.id, target_wallet_id:  @user.user_wallet.id, amount: transaction_amount)
      else
        render json: { error: "You don't have this stock or stock have Insufficient balence"}
      end
    end
  end
end