module Helper
  def helper
    if self.is_a? Hash
      a = self.to_a
    elsif self.is_a? Array
      a =self
    end
    return Proc.new do |i|
         case(self.class.inspect)
            when  "Hash"
                 a[i]
            when "Array"
               a[i]
           end
      end
  end
end



module Enumerable
  include Helper
  def my_each
    f = helper
    i = 0
    while i < self.length do
        yield(f.call(i))
        i+=1
    end
  end

  def my_each_with_index
    a = (0...self.length).to_a.zip(self)
    a.my_each {|i,x| yield(i,x)}
  end

  def my_select
    r = []
    self.my_each do |x| r <<x if yield(x) end
    r
  end

  def my_all?
    t = true
    self.my_each do |x| t &&= yield(x) end
    t
  end
  def my_any?
    t = false
    self.my_each do |x| t ||= yield(x) end
    t
  end

  def my_none?
    t = false
    self.my_each do |x| t ||= yield(x) end
    t == false
  end

  def my_count
    count = 0
    self.my_each do |x| count+= 1 if  yield(x) end
    count
  end

  def my_map
    r  = []
    self.my_each do |x| r <<  yield(x) end
    r
  end

  def my_inject(init)
    r  = init
    self.my_each do |x| r =  yield(r , x) end
    r
  end
end


class Hash
  include Enumerable
end

class Array
   include Enumerable
 end


  a = [[1,2],[3,3],[5,8],[1,6]]
  h = Hash[a]
p h
h.my_each {|k,v| p %Q[ #{k} it's a hash:: #{v} ]}
print  h.my_map {|i,x|   %Q[ #{i} it's an array : #{x}]}
