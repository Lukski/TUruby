class CourseController < SearchableController
  def get_search(query)
    "https://tiss.tuwien.ac.at/api/search/course/v1.0/quickSearch?searchterm=#{query}"
  end
end
