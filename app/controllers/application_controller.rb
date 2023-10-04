class ApplicationController < ActionController::API
  def authenticate_user
    @user = User.find_by(auth_token: params[:auth_token])
    if @user.nil?
      render json: { error: 'You have to login first' }, status: :unauthorized
    elsif  DateTime.now > @user.token_expires_at
      render json: { error: 'Session expire please loging again' }, status: :unauthorized
    end
  end
end
