class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    person_favorites = current_user.favorites.where(object_type: PersonController.object_type)
    @favorite_persons = []
    person_favorites.each do |person|
      query = PersonController.get_detail_url person.tiss_id
      uri = URI(query)
      result = [Nokogiri::HTML(open(uri)), person.tiss_id]
      @favorite_persons << result
    end

    course_favorites = current_user.favorites.where(object_type: CourseController.object_type)
    @favorite_courses = []
    course_favorites.each do |course|
      query = CourseController.get_detail_url course.tiss_id
      uri = URI(query)
      result = [Nokogiri::HTML(open(uri)), course.tiss_id]
      @favorite_courses << result
    end

    thesis_favorites = current_user.favorites.where(object_type: ThesisController.object_type)
    @favorite_thesis = []
    thesis_favorites.each do |thesis|
      query = ThesisController.get_detail_url thesis.tiss_id
      uri = URI(query)
      result = [Nokogiri::HTML(open(uri)), thesis.tiss_id]
      @favorite_thesis << result
    end

    project_favorites = current_user.favorites.where(object_type: ProjectController.object_type)
    @favorite_project = []
    project_favorites.each do |project|
      query = ProjectController.get_detail_url project.tiss_id
      uri = URI(query)
      result = [Nokogiri::HTML(open(uri)), project.tiss_id]
      @favorite_thesis << result
    end
  end

  def create
    #back = params[:origin]
    current_user.favorites.create favorite_params
    redirect_back fallback_location: 'people#search'
  end

  def delete
    favorite = current_user.favorites.where favorite_params
    favorite.destroy_all
    redirect_back fallback_location: 'people#search'
  end

  private
  def favorite_params
    params.permit(:tiss_id, :object_type)
  end
end
