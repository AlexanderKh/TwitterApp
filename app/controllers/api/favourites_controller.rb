class Api::FavouritesController < APIController

  before_action :authenticate!
  before_action :load_favorable_klass, only: [:create]

  def index
    @favourites = current_user.favourites.includes(:favourable)
  end

  def create
    favourable = @favourable_klass.find(favourite_params[:favourable_id])
    favourite = current_user.favourites.create(favourable: favourable)
    render json: favourite
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    head :ok
  end

  private

  def load_favorable_klass
    type = favourite_params[:favourable_type]
    type_permitted = Favourite::FAVOURABLES.include? type
    if type_permitted
      @favourable_klass = type.capitalize.constantize
    else
      head :bad_request
    end
  end

  def favourite_params
    params.require(:favourite).permit(:user_id, :favourable_id, :favourable_type)
  end
end
