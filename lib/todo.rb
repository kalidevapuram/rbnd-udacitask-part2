class TodoItem
	include Listable   #includes listable module
  	attr_reader :description, :due, :priority

  	def initialize(description, options={})  #Initalizes a variable 
    	@description = description
    	@due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    	@priority = options[:priority]
  	end
  
  
  	def add_date  #add the due date
  		"due: " + format_date(@due) 
  	end
  	
  
  	def add_type
  		"todo" #prints the item type as todo
  	end
  
end
