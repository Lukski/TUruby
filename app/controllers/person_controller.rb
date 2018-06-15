class PersonController < SearchableController
  def self.get_search(query)
    "https://tiss.tuwien.ac.at/api/person/v21/psuche?q=#{query}"
  end

  def self.get_detail_url(id)
    "https://tiss.tuwien.ac.at/api/person/v21/id/#{id}"
  end

  def self.object_type()
    :person
  end
end
