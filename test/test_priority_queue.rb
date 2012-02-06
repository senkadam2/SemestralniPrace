# To change this template, choose Tools | Templates
# and open the template in the editor.
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit' 
require 'priority_queue'
require 'node'

# Add your testcases here

class TestPriorityQueue < Test::Unit::TestCase
  def setup
    @q=PriorityQueue.new
    @a=Node.new("a",0.8,nil,nil)
    @b=Node.new("b",0.7,nil,nil)
    @c=Node.new("c",0.5,nil,nil)
    @d=Node.new("d",0.3,nil,nil)
    @e=Node.new("e",0.1,nil,nil)
  end
  
  def test_insert_one
    @q.push(@a)
    assert_equal(@q.pop.prob,0.8)
  end
  
  def test_insert_ordered
    @q.push(@a)
    @q.push(@b)
    @q.push(@c)
    @q.push(@d)
    @q.push(@e)
    assert_equal(@q.pop.prob,0.1)
    assert_equal(@q.pop.prob,0.3)
    assert_equal(@q.pop.prob,0.5)
    assert_equal(@q.pop.prob,0.7)
    assert_equal(@q.pop.prob,0.8)
  end
  
  def test_insert_backwards
    @q.push(@e)
    @q.push(@d)
    @q.push(@c)
    @q.push(@b)
    @q.push(@a)
    assert_equal(@q.pop.prob,0.1)
    assert_equal(@q.pop.prob,0.3)
    assert_equal(@q.pop.prob,0.5)
    assert_equal(@q.pop.prob,0.7)
    assert_equal(@q.pop.prob,0.8)
  end
  
  def test_insert_random_1
    @q.push(@a)
    @q.push(@c)
    @q.push(@d)
    @q.push(@b)
    @q.push(@e)
    assert_equal(@q.pop.prob,0.1)
    assert_equal(@q.pop.prob,0.3)
    assert_equal(@q.pop.prob,0.5)
    assert_equal(@q.pop.prob,0.7)
    assert_equal(@q.pop.prob,0.8)
  end
  
  def test_insert_random_2
    @q.push(@c)
    @q.push(@a)
    @q.push(@b)
    @q.push(@e)
    @q.push(@d)
    assert_equal(@q.pop.prob,0.1)
    assert_equal(@q.pop.prob,0.3)
    assert_equal(@q.pop.prob,0.5)
    assert_equal(@q.pop.prob,0.7)
    assert_equal(@q.pop.prob,0.8)
  end
  
  def test_insert_random_3
    @q.push(@d)
    @q.push(@b)
    @q.push(@e)
    @q.push(@d)
    @q.push(@a)
    @q.push(@d)
    @q.push(@d)
    assert_equal(@q.pop.prob,0.1)
    assert_equal(@q.pop.prob,0.3)
    assert_equal(@q.pop.prob,0.3)
    assert_equal(@q.pop.prob,0.3)
    assert_equal(@q.pop.prob,0.3)
    assert_equal(@q.pop.prob,0.7)
    assert_equal(@q.pop.prob,0.8)
  end
  
   def test_pop_nil
    @q.push(@d)
    @q.pop()
    assert_equal(@q.pop,nil)
  end
end

