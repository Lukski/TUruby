require 'net/http'
require 'json'
require 'nokogiri'
require 'open-uri'

class SearchableController < ApplicationController
  before_action :authenticate_user!

  def search
    @query = params[:q]
    if @query != ""
      @tissquery = get_search @query
      uri = URI(@tissquery)
      response = Net::HTTP.get(uri)
      my_hash = JSON.parse(response)
      @results = []
      if my_hash
        @results = my_hash["results"]
      end
    end
  end

  def detail
    @id = params[:id]
    if @id != ""
      @tissquery = get_detail_url @id
      uri = URI(@tissquery)
      @result = Nokogiri::HTML(open(uri))
    end
  end
end
