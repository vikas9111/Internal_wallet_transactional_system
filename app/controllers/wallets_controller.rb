class WalletsController < ApplicationController
  before_action :authenticate_user

  def check_balance
    wallet = @user.user_wallet
    render json: { success: "Your current balance is #{wallet.balance}" }, status: '200'
  end

  def deposit
    wallet = @user.user_wallet
    if params[:amount].to_i > 0
      if wallet.update(balance: wallet.balance + params[:amount].to_i)
        render json: { success: "Rupee #{params[:amount]} deposit successfully in your acount, Your current balance is #{wallet.balance}" }, status: '200'
      else
        render json: { error: "Transaction faild"}
      end
    else
      render json: { error: "please enter valid amount"}
    end
  end

  def withdraw
    wallet = @user.user_wallet
    if params[:amount].to_i > 0
      if wallet.balance < params[:amount].to_i
        render json: { error: "Insufficient funds"}
      elsif wallet.update(balance: wallet.balance - params[:amount].to_i)
        render json: { success: "Rupee #{params[:amount]} withdraw successfully from your acount, Your current balance is #{wallet.balance}" }, status: '200'
      else
        render json: { error: "Transaction faild"}
      end
    else
      render json: { error: "please enter valid amount"}
    end
  end
end
