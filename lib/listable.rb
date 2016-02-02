module Listable
  # Listable methods go here
  attr_reader :description, :due, :priority
  
  def format_description(description)
  	"#{description}".ljust(30)
  end
  
  
  
  
  
  
end

