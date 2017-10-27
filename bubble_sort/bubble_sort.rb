#!/usr/bin/ruby


def bubble_sort(array)
  n = array.size
  array = array.clone
  inversion = true
  while n > 0 && inversion
  inversion = false
     (n-1).times do |i|
         p = array[i,2] 
         inversion = p[0] > p[1]
         array[i,2] = p.reverse if inversion 
      end
  n-=1
  end
array
end 

