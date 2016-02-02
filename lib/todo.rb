class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  def format_date
  		@due ? @due.strftime("%D") : "No due date"

  end
  def format_priority
  value = " ⇧".colorize(:color => :green)if @priority == "high"
    	value = " ⇨".colorize(:color => :yellow) if @priority == "medium"
    	value = " ⇩".colorize(:color => :red) if @priority == "low"
    	value = " " if !@priority
    	return value
  end
  
  def details
    format_description(@description) + "due: " +
    format_date + 
    format_priority
  end
end
