class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    #back = params[:origin]
    current_user.favorites.create favorite_params
    redirect_back fallback_location: 'people#search'
  end

  private
  def favorite_params
    params.permit(:tiss_id, :object_type)
  end
end
