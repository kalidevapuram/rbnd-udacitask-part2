class EventItem
  include Listable  #includes listable module
  attr_reader :description, :start_date, :end_date  

  def initialize(description, options={})
    @description = description   #assigns to local variable @description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date] #if it is startdate or enddate it uses chronic gem and assigns to their local variables
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
  end

  
  def add_date
  	"event dates: " + format_date(@start_date, @end_date) #it adds the event start date and end dates
  end
  
  
  def add_type
  	"event" #prints the item type as event
  end
  
end
