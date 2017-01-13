class Api::UsersController < APIController

  before_action :authenticate!, except: [:index]
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    render @user
  end

  def follow
    if (current_user != @user) && current_user.follows.create(followee: @user)
      head :ok
    else
      head 500
    end
  end

  def unfollow
    if current_user.follows.find_by(followee: @user).destroy
      head :ok
    else
      head 500
    end
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
