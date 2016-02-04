module Listable #it is a module 
  # Listable methods go here
	attr_reader :description, :due, :priority
  	
  	
  	def format_description
  		"#{description}".ljust(30) #prints the description name and give 30 letter space to print details
  	end
  
  	def format_date(*date) #*date is an array
  		if (date.length == 1 ) || (date.length == 0 )
			@due ? @due.strftime("%D") : "No due date"  #if the above condition satisfies, checks for due date and prints duedate or print no due date
		else
  			dates = @start_date.strftime("%D") if @start_date#pushes the start date
    		dates << " -- " + @end_date.strftime("%D") if @end_date #pushes the end date
    		dates = "N/A" if !dates #if there is no start date or end date it prints N/A
    		return dates
	    end
	end
	
	
	def format_priority
		if @priority == "super high"    #checks for the priority 
			raise UdaciListErrors::HighPriorityError, "InvalidPriorityValue"  #if it did not find priority it throws an error
		else
			value = " ⇧⇧".colorize(:color => :red)if @priority == "high"   #if the priority is high print uparrow in red color
    		value = " ⇨⇨".colorize(:color => :yellow) if @priority == "medium" #if the priority is medium print sidearrow in yellow color
    		value = " ⇩⇩".colorize(:color => :green) if @priority == "low"  #if the priority is low print downarrow in green color
    		value = " " if !@priority  #if there is no priority prints nothing
    		return value
    	end
    end
  
  
end

