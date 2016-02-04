module UdaciListErrors
   # Error classes go here
  class ImageError < StandardError  #if it does not imagetype it trows an error which inherits from standard error class
  end
  
  class DeleteError < StandardError  #Trows this deleteerror if it able to access an index morethan array length
  end
  
  class HighPriorityError < StandardError  #there is no high priority initailized, so it throws an error
  end
  
end
