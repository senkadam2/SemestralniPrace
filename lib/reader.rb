# To change this template, choose Tools | Templates
# and open the template in the editor.

class Reader
  def initialize
    
  end
  
  def initialize(path)
    @path=path
  end
  
  def open
    @f=File.open(@path,"r")
  end
  
  def get_symbol
    char=@f.getc
    if(char!=nil)
      char.chr
    end
    char
  end
  
  def close
    @f.close_read
  end
  
  def is_symbol?(ch)
    tr=true
    if(ch=='0')
      tr=false
    end
    
    if(ch=='1')
      tr=false
    end
    tr
  end
  
  def is_end?(ch)
    tr=false
    if(ch=='/')
      @bad=self.get_symbol
      if(@bad=='/')
        tr=true
        @bad=nil
      end
    
      tr
    
    end
  end
    
    def bad
      @bad
    end
  end


