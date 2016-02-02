module Listable
  # Listable methods go here
  attr_reader :description, :due, :priority
  
  def format_description(description)
  	"#{description}".ljust(30)
  end
  
  def format_date(*date)
  
if (date.length == 1 ) || (date.length == 0 )
		@due ? @due.strftime("%D") : "No due date"
		else
  		dates = @start_date.strftime("%D") if @start_date
    	dates << " -- " + @end_date.strftime("%D") if @end_date
    	dates = "N/A" if !dates
    	return dates
	    
	end
	end
	
	
	def format_priority(priority)
		value = " ⇧".colorize(:color => :green)if @priority == "high"
    	value = " ⇨".colorize(:color => :yellow) if @priority == "medium"
    	value = " ⇩".colorize(:color => :red) if @priority == "low"
    	value = " " if !@priority
    	return value
    end
  
  
  
  
end

