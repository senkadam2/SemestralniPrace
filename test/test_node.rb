# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'node'
require 'tables'

class TestNode < Test::Unit::TestCase
  
  def setup
    @table=SymbolTable.new
  end
  
  def test_code
    @a=Node.new("a",nil,nil,nil)
    @b=Node.new("b",nil,nil,nil)
    @c=Node.new("c",nil,@a,@b)
    assert_nil(@c.code)
    @c.define_code("0",@table)
    assert_equal(@c.code, "0")
    assert_equal(@a.code, "00")
    assert_equal(@b.code, "01")
  end
  
   def test_code
    @a=Node.new("a",nil,nil,nil)
    @b=Node.new("b",nil,nil,nil)
    @c=Node.new("c",nil,@a,@b)
    @d=Node.new("c",nil,nil,nil)
    @e=Node.new("c",nil,@c,@d)
    assert_nil(@c.code)
    @e.define_code("0",@table)
    assert_equal(@e.code, "0")
    assert_equal(@c.code, "00")
    assert_equal(@d.code, "01")
    assert_equal(@a.code, "000")
    assert_equal(@b.code, "001")
  end
end
