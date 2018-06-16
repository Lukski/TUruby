class CourseController < SearchableController
  def self.get_search(query)
    "https://tiss.tuwien.ac.at/api/search/course/v1.0/quickSearch?searchterm=#{query}"
  end

  def self.get_detail_url(id)
    "https://tiss.tuwien.ac.at/api/course/#{id}"
  end

  def self.object_type()
    :course
  end

  def self.get_id_from_json(result)
    url = result["detail_url"]
    get_course_id_from_url url
  end

  def self.get_course_id_from_url(url)
    /courseNr=(?<coursenr>\d+)/ =~ url
    /semester=(?<semester>\d+[sSwW])/ =~ url
    return "#{coursenr}-#{semester}"
  end
end
