class UdaciList
	attr_reader :title, :items

	def initialize(options={})
		@title = options[:title]  #Initailizes the title and creates an array
    	@items = []
  	end
  	
  	def add(type, description, options={}) #add method adds the type, description in to an items array
  		type = type.downcase
    	if type == "image"  #if the type is not initailized throws an error
  			raise UdaciListErrors::ImageError,  "InvalidItemType"
  		else
  			@items.push TodoItem.new(description, options) if type == "todo" #if type is todo, pushes new todoitem into @items array
    		@items.push EventItem.new(description, options) if type == "event" #if type is event, pushes new EventItem into @items array
    		@items.push LinkItem.new(description, options) if type == "link" #if type is link, pushes new LinkItem into @items array
    
		end
  end
  
	def delete(*numbers)  #*numbers is an array 
    	if (numbers[0] > @items.length) #if the number to delete is morethan arraylength throws an error
    		raise UdaciListErrors::DeleteError, "IndexExceedsListSize"
    	else
			numbers.each do |number| #takes each number from numbers array
    			@items.delete_at(number-1)#delets that item
			end
		end

  	end
  	
  
	def all  #this method print the output
		$new_array = [] #creating anempty array
		@items.each_with_index do |item, position| #takes each item from array and incresing the position value
		#pushes the item details in to new_array
			$new_array <<  ["#{position + 1}", "#{item.format_description}", "#{item.add_date}", "#{item.format_priority}", "#{item.add_type}" ]
    	end
		add_table #calls the add_table method
	end
	
  
	def add_table# this method id mainly used for print the output in table format
  		table = Terminal::Table.new :headings => ['S.No', 'Content', 'Details', 'Priority', 'Type'] do |t|
    		t.rows = $new_array#assign the heading to rows
		end
		puts table #prints the final table with rows and column
    end
  
  
	def filter(type)  #this method selects the specific item type and prints only those items
		new_arr = @items.select do |item|
  			item.class == EventItem  #select the EventItemtype only
  		end
		puts "\n\n"
		$new_array = []
		new_arr.each_with_index do |item,position| # printing the single item in the array 
			$new_array <<  ["#{position + 1}", "#{item.format_description}", "#{item.add_date}", "#{item.format_priority}", "#{item.add_type}" ]
		end
		add_table  #calls the add_table method
	end
	

	def artii
		a = Artii::Base.new :font => 'big'  #this method prints the title in ascii format with font big
		puts a.asciify(@title)
	end


	def find(n) #finding the particular item through index
		$new_array = []
		@items.each_with_index do |item, position| 
			if (position == n-1) #if n matches the position prints the particular item
				$new_array <<  ["#{1}", "#{item.format_description}", "#{item.add_date}", "#{item.format_priority}", "#{item.add_type}" ]
			end 
		end
		add_table  #calls the add_table method
	end

end
