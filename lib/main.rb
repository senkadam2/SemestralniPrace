# To change this template, choose Tools | Templates
# and open the template in the editor.
require_relative "executor.rb"

if(ARGV.length!=3)
  raise ArgumentError, "wrong number of arguments (insert 3 arguments)"
end

case ARGV[0]
  when '0'
    e=Executor.new(ARGV[1],true,ARGV[2]) 
  when '1'
    e=Executor.new(ARGV[1],false,ARGV[2]) 
else
  raise ArgumentError, "first argument have to be 0 for coding or 1 for decoding"
end
e.run
