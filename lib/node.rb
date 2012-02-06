# To change this template, choose Tools | Templates
# and open the template in the editor.

class Node
  attr_accessor:prob,:symbol,:code,:left,:right
  def initialize
    
  end
  
  def initialize (symbol, prob,left,right)
    @symbol=symbol
    @prob=prob
    @left=left
    @right=right
  end
  
  def define_code (code,code_table)
    @code=code
    if(left!=nil)
      left.define_code(code+"0",code_table)
    else
      code_table.put(@symbol,@code)
    end
    
    if(right!=nil)
      right.define_code(code+"1",code_table)
    else
      code_table.put(@symbol,@code)
    end
      
  end
    
end
