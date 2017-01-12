class APIController < ActionController::API

  def authenticate!
    begin
      payload, header = TokenProvider.decode(token)
      @current_user = User.find_by(id: payload['user_id'])
    rescue
      render json: 'Unauthorized', status: 401
    end
  end

  def current_user
    @current_user ||= authenticate!
  end
  helper_method :current_user

  def token
    request.headers['Authorization'].split(' ').last
  end
end
