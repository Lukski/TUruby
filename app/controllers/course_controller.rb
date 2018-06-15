class CourseController < SearchableController
  def get_search(query)
    "https://tiss.tuwien.ac.at/api/search/course/v1.0/quickSearch?searchterm=#{query}"
  end

  def get_detail_url(id)
    "https://tiss.tuwien.ac.at/api/thesis/#{id}"
  end
end
