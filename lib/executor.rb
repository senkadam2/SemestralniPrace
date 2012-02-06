# To change this template, choose Tools | Templates
# and open the template in the editor.

require_relative "reader.rb"
require_relative "writer.rb"
require_relative "tables.rb"
require_relative "node.rb"
require_relative "priority_queue.rb"

class Executor
  def initialize
    
  end
  
  def initialize (path, code_exec,output_path)
    @path=path
    @code_exec=code_exec
    @output_path=output_path
  end
  
  def decode
    
    self.make_symbol_table
    self.decode_symbols
  end
  
  def decode_symbols
    writer=Writer.new(@output_path)
    writer.open
    ch=@reader.get_symbol.to_s
    output=""
    while (ch!=nil)
      ret=@symbol_table.get(ch)
      if(ret!=nil)
        output=output+ret
        ch=""
      end
      if(output.length>99)
        writer.write_string(output)
        output=""
      end
      read=@reader.get_symbol
      if(read==nil)
        ch=nil
      else
       ch=ch+read.to_s
      end
      
      
    end
    writer.write_string(output)
    writer.close
    @reader.close
  end
  
  def make_symbol_table
    @symbol_table=SymbolTable.new
    @reader= Reader.new(@path)
    @reader.open
    ch=@reader.get_symbol
    puts "ch"
    while true
      
      if(@reader.is_symbol?(ch))
        
        if(@reader.is_end?(ch))
          break
        else
          
          symbol=ch
          if(@reader.bad!=nil)
            string=@reader.bad.to_s
          else
            string=""
          end
          
          ch=@reader.get_symbol
          while(!@reader.is_symbol?(ch))
            string=string+ch.to_s
            ch=@reader.get_symbol
          end
          
          @symbol_table.put(string,symbol)
        end
        
      end
      
      
    end
        
    
  end
  
  
  
  def code
    self.count_symbols
    self.compute_probability
    self.symbols_to_code
    self.make_output
  end
  
  def make_output
    writer=Writer.new(@output_path)
    reader= Reader.new(@path)
    writer.open
    @code_table.table.each_pair { |key,value| writer.write_string(key.to_s+value) }
    reader.open
    key=reader.get_symbol
    writer.write_string("//")
    while key!=nil
      writer.write_string(@code_table.get(key))
      key=reader.get_symbol
    end
    
    writer.close
    reader.close
    
    
  end
  
  def symbols_to_code
    @q=PriorityQueue.new
    @prob_table.table.each_pair { |key,value| @q.push(Node.new(key,value,nil,nil))  }
     while (@q.size!=1)
       a=@q.pop
       b=@q.pop
       n=Node.new(nil,a.prob+b.prob,a,b)
       @q.push(n)
     end 
     @code_table=SymbolTable.new
     @q.pop.define_code("0",@code_table)
     
  end
  
  def compute_probability
    @prob_table=ProbabilityTable.new
    @symbol_table.table.each_key {|key| @prob_table.put_with_prob(key,@symbol_table) }
   
  end
  
  def count_symbols
    reader= Reader.new(@path)
    reader.open
    key=reader.get_symbol
    @symbol_table=CountTable.new
    puts key
    while key!=nil
      @symbol_table.count_key(key)
      key=reader.get_symbol
      puts key
    end
    reader.close
   
  end
  
   
  
  def run
    if (@code_exec)
      self.code
    else
      self.decode
    end
  end
  
end
