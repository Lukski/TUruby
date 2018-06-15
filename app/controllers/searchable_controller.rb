require 'net/http'
require 'json'
require 'nokogiri'
require 'open-uri'

class SearchableController < ApplicationController
  before_action :authenticate_user!

  def search
    @query = params[:q]
    if @query != ""
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
      #@favorites = self.class.get_favorites ids
    end
  end

  def detail
    @id = params[:id]
    if @id != ""
      @tissquery = self.class.get_detail_url @id
      uri = URI(@tissquery)
      @result = Nokogiri::HTML(open(uri))
    end
  end

  def self.get_id_from_json(result)
    result["id"]
  end
end
