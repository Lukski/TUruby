class ProjectController < SearchableController

  def self.get_search(query)
    "https://tiss.tuwien.ac.at/api/search/projectFullSearch/v1.0/projects?searchterm=#{query}"
  end

  def self.get_detail_url(id)
    "https://tiss.tuwien.ac.at/api/pdb/rest/project/v2/#{id}"
  end

  def self.object_type()
    :project
  end

  def self.get_project_id_from_url(url)
    x = url.split("=")
    return x[1]
  end

  def self.removetags(tagelement)
    x = "" + tagelement
    regex = /<("[^"]*"|'[^']*'|[^'">])*>/
    return x.sub(regex,'')
  end

end
