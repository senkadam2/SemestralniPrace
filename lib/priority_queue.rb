# To change this template, choose Tools | Templates
# and open the template in the editor.
require_relative "node.rb"

class PriorityQueue
  def initialize
    @array=Array.new
  end
  
  def push(node)
    puts node.prob
    if(@array.empty?)
      @array.push(node)
    else
      tr=true
      @array.each_index { |x| if(@array[x].prob < node.prob); @array.insert(x,node);tr=false;break;end}
       if(tr)
         @array.push(node)
       end
               
    end
    
  end
  
  def pop
    @array.pop()
  end
  
  def size
    @array.size
  end
end
