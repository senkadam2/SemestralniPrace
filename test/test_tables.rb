# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit' 
require 'tables'

class TestTables < Test::Unit::TestCase
  
  def test_symbol_table
    @t=SymbolTable.new
    @t.put(2, "a")
    
    assert_nil(@t.get(1))
    assert_equal(@t.get(2), "a")
  end
  
  def test_count_table
    @t=CountTable.new
    @t.count_key("a")
    @t.count_key("b")
    @t.count_key("a")
    @t.count_key("a")
    @t.count_key("b")
    @t.count_key("a")
    @t.count_key("c")
    
    
    assert_nil(@t.get("d"))
    assert_equal(@t.get("a"),4 )
    assert_equal(@t.get("b"),2 )
    assert_equal(@t.get("c"),1 )
    
  end
  
  
  def test_prob_table
    @t=CountTable.new
    @t.count_key("a")
    @t.count_key("b")
    @t.count_key("a")
    @t.count_key("a")
    @t.count_key("b")
    @t.count_key("a")
    @t.count_key("c")
    
    @tprob=ProbabilityTable.new
    @tprob.put_with_prob("a", @t)
    @tprob.put_with_prob("b", @t)
    @tprob.put_with_prob("c", @t)
    
    
    assert_nil(@tprob.get("d"))
    assert_equal(@tprob.get("a"),(4.to_f/7.to_f) )
    assert_equal(@tprob.get("b"),2.0/7.0 )
    assert_equal(@tprob.get("c"),1.0/7.0 )
    
  end
  
end
