class LinkItem
  include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end
  
  def format_name
    @site_name ? @site_name : ""
  end
  # def details
#     format_description(@description) + "site name: " + format_name
#   end

def add_description
  format_description(@description)
  end 
  
  
  
  def add_date
  "site name: " + format_name
  
  end
  def add_priority
  format_priority(@priority)
  end
  def add_type
  "link"
  end

end
