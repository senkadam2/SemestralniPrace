# To change this template, choose Tools | Templates
# and open the template in the editor.


  class SymbolTable
    attr_accessor:table
    def initialize
      
      @table= Hash.new
    end
    
    def put(key, object)
      @table.store(key, object)
    end
    
    def get(key)
      if(@table.has_key?(key))
      @table.fetch(key)
      else
        nil
      end
    end
  end
  
  class CountTable < SymbolTable
    attr_accessor :symbols_count
    def initialize
      super()
      @symbols_count=0
    end
    
    def count_key (key)
      count=@table.delete(key)
      @symbols_count=@symbols_count+1
      if(count==nil)
        count=1
        
      else
        count=count+1
      end
      @table.store(key,count)
    end
    
  end
  
  class ProbabilityTable < SymbolTable
    def initialize
      super()
    end
    
    def put_with_prob (key,table)
      count=table.get(key)
      prob=count.to_f/table.symbols_count.to_f
      self.put(key, prob)
    end
            
  end

