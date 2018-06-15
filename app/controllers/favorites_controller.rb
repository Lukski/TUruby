class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    person_favorites = PersonController.get_favorites
    @favorite_persons = []
    person_favorites.each do |person|
      query = PersonController.get_detail_url person.tiss_id
      uri = URI(query)
      result = Nokogiri::HTML(open(uri))
      @favorite_persons << result
    end
  end

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
