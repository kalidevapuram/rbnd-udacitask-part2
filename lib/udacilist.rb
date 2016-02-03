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
  
  def delete(*numbers)
    if (numbers[0] > @items.length)
    	raise UdaciListErrors::DeleteError, "IndexExceedsListSize"
    	
    else
#     	@items.delete_at(index - 1)
numbers.each do |index|
    @items.delete_at(index-1)
end
    end

  end
  
  def all
#   puts @items
    # puts "-" * @title.length
#     puts @title
#     puts "-" * @title.length
	new_array = []
	@items.each_with_index do |item, position|
		new_array <<  ["#{position + 1}", "#{item.add_description}", "#{item.add_date}", "#{item.add_priority}", "#{item.add_type}" ]
    end
    table = Terminal::Table.new :headings => ['S.No', 'Content', 'Details', 'Priority', 'Type'] do |t|
    	t.rows = new_array
	end
	puts table
    
  end
  
  
  
  def filter(type)

  new_arr = @items.select do |item|
  item.class == EventItem
  
end
puts "\n\n"
new_array = []

new_arr.each_with_index do |item,position|
new_array <<  ["#{position + 1}", "#{item.add_description}", "#{item.add_date}", "#{item.add_priority}", "#{item.add_type}" ]
# puts "#{position + 1}) #{new_item.details}"
end
table = Terminal::Table.new :headings => ['S.No', 'Content', 'Details', 'Priority', 'Type'] do |t|
    t.rows = new_array
end
puts table
end

def artii
a = Artii::Base.new :font => 'big'
puts a.asciify(@title)
end


def find(n)
	new_array = []

	@items.each_with_index do |item, position|
		if (position == n-1)
       "#{1} #{item.add_description} #{item.add_date} #{item.add_priority} #{item.add_type}" 
# 			new_array <<  ["1", "#{item.add_description}", "#{item.add_date}", "#{item.add_priority}" ]
    	end
    	# table = Terminal::Table.new :headings => ['S.No', 'Content', 'Details', 'Priority'] do |t|
#     	t.rows = new_array
# 		end
# 		puts table
    end
#     		puts table

    end

# end

  
end
