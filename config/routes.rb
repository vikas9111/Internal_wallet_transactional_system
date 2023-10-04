Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'

  get 'wallets/check_balance', to: 'wallets#check_balance'
  post 'wallets/deposit', to: 'wallets#deposit'
  post 'wallets/withdraw', to: 'wallets#withdraw'

  get 'stocks/available_stocks', to: 'stocks#available_stocks'
  post 'stocks/purchase_stock', to: 'stocks#purchase_stock'
  post 'stocks/sale_stock', to: 'stocks#sale_stock'
end
