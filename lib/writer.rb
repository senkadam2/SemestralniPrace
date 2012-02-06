# To change this template, choose Tools | Templates
# and open the template in the editor.

class Writer
  
  def initialize(path)
    @path=path
  end
  
  def open
    @f=File.new(@path,"w")
  end
  
  def write_string(st)
    @f.write(st)
  end
  
  def close
    @f.close_write
  end
end

