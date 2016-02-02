class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
  type = type.downcase
    if type == "image"
  		raise UdaciListErrors::ImageError,  "InvalidItemType"
  	else
  	@items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
	end
  end
  
  def delete(index)
    if (index > @items.length)
    	raise UdaciListErrors::DeleteError, "IndexExceedsListSize"
    else
    	@items.delete_at(index - 1)
    end
  end
  
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}" 
    end
  end
  
  def filter(type)

  new_arr = @items.select do |item|
  item.class == EventItem
  
end
puts "\n\n"

new_arr.each_with_index do |new_item,position|
puts "#{position + 1}) #{new_item.details}"
end
end
  
end
