class Auth::OAuthController < ApplicationController

  def callback
    provider = auth_params[:provider]

    # See https://github.com/sahat/satellizer/issues/287
    unless Rails.cache.read("#{request.referer}")
      Rails.cache.write("#{request.referer}", true, expires_in: 5.seconds)
      return head :ok
    end

    if (@user = login_from(provider))
      render json: { token: user_token(@user), user: @user }
    else
      begin
        @user = create_from(provider)
        reset_session
        render json: { token: user_token(@user), user: @user }
      rescue
        head 422
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
