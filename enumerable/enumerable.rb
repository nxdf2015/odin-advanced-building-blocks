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
    raise SyntaxError unless block_given?
    f = helper
    i = 0
    while i < self.length do
        yield(f.call(i))
        i+=1
    end
  end

  def my_each_with_index
    raise SyntaxError unless block_given?
    a = (0...self.length).to_a.zip(self)
    a.my_each {|i,x| yield(i,x)}
  end

  def my_select
    raise SyntaxError unless block_given?
    r = []
    self.my_each do |x| r <<x if yield(x) end
    r
  end

  def my_all?
    raise SyntaxError unless block_given?
    t = true
    self.my_each do |x| t &&= yield(x) end
    t
  end
  def my_any?
    raise SyntaxError unless block_given?
    t = false
    self.my_each do |x| t ||= yield(x) end
    t
  end

  def my_none?
    raise SyntaxError unless block_given?
    t = false
    self.my_each do |x| t ||= yield(x) end
    t == false
  end

  def my_count
    raise SyntaxError unless block_given?
    count = 0
    self.my_each do |x| count+= 1 if  yield(x) end
    count
  end

  def my_map(p = nil)
    r  = []
    if p.is_a? Proc
        self.my_each do |x| r <<  p.call(x) end
    else
        raise SyntaxError unless block_given?
        self.my_each do |x| r <<  yield(x) end
    end
    r
  end

  def my_inject(init)
    raise SyntaxError unless block_given?
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
