class ApplicationController < ActionController::Base

  def user_token(user)
    TokenProvider.issue_token(user_id: user.id)
  end
end
