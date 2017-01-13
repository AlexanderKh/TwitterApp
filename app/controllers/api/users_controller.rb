class Api::UsersController < APIController

  before_action :authenticate!, except: [:index]
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    render @user
  end

  def update
    head :unauthorized if current_user != @user
    if @user.update(user_params)
      render @user
    else
      head 500
    end
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

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
