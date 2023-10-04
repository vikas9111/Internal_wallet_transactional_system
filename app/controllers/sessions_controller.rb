class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      user.generate_auth_code
      render json: { auth_token: user.auth_token, token_expires_at: user.token_expires_at}, status: :created
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end