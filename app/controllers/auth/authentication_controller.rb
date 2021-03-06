class Auth::AuthenticationController < ApplicationController

  def login
    if (user = User.authenticate(login_params[:username], login_params[:password]))
      render json: { token: user_token(user), user: user }
    else
      head 401
    end
  end

  def register
    user = User.new(registration_params)
    if user.valid?
      user.save!
      render json: { token: user_token(user), user: user }
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  private

  def login_params
    params.require(:auth).permit(:username, :password)
  end

  def registration_params
    params.require(:auth).permit(:username, :password, :password_confirmation)
  end
end
