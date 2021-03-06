require 'net/http'
require 'json'
require 'nokogiri'
require 'open-uri'

class SearchableController < ApplicationController
  before_action :authenticate_user!

  def search
    @query = params[:q]
    if @query != "" and @query
      @tissquery = self.class.get_search @query
      uri = URI(@tissquery)
      response = Net::HTTP.get(uri)
      my_hash = JSON.parse(response)
      @results = []
      if my_hash
        @results = my_hash["results"]
      end
      @ids=[]
      if @results
        @results.each do |result|
          @ids << self.class.get_id_from_json(result)
        end
      end
      @favorites = current_user.favorites.where(object_type: self.class.object_type, tiss_id: @ids)
      @favorite_ids=[]
      if @favorites
        @favorites.each do |result|
          if result.tiss_id.to_i.digits.count == result.tiss_id.length
            @favorite_ids << result.tiss_id.to_i
          else
            @favorite_ids << result.tiss_id
          end
        end
      end
    end
  end

  def detail
    @id = params[:id]
    if @id != ""
      @tissquery = self.class.get_detail_url @id
      uri = URI(@tissquery)
      @result = Nokogiri::HTML(open(uri))
      @is_favorite = current_user.favorites.exists?(object_type: self.class.object_type, tiss_id: "#{@id}")
    end
  end

  def self.get_id_from_json(result)
    result["id"]
  end
end
