class LinkItem
	include Listable   #includes listable module
  	attr_reader :description, :site_name

  	def initialize(url, options={})
    	@description = url    #assigns the url to instance varaible @description
    	@site_name = options[:site_name]
  	end
  
  	def format_name
    	@site_name ?  @site_name : ""  #checks for the site_name by using ternary operator, if it founds prints the site_name
  	end
  
  
  	def add_date
  		"site name: " + format_name  #print the sitename and calls the format_name method
  	end
  	
  
  	def add_type
  		"link"   #prints the item type as link
  	end

end
