class PersonController < SearchableController
  def get_search(query)
    "https://tiss.tuwien.ac.at/api/person/v21/psuche?q=#{query}"
  end

  def get_detail_url(id)
    "https://tiss.tuwien.ac.at/api/person/v21/id/#{id}"
  end
end
