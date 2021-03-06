class ThesisController < SearchableController
  def self.get_search(query)
    "https://tiss.tuwien.ac.at/api/search/thesis/v1.0/quickSearch?searchterm=#{query}"
  end

  def self.get_detail_url(id)
    "https://tiss.tuwien.ac.at/api/thesis/#{id}"
  end

  def self.object_type()
    :thesis
  end
end
