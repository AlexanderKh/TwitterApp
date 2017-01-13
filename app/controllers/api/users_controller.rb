class Api::UsersController < APIController

  before_action :authenticate!
  before_action :set_user

  def show
    render @user
  end

  def follow

  end

  def unfollow

  end

  def favourite

  end

  def remove_favourite

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
