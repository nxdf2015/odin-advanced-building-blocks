


def bubble_sort_by(array)
  array = array.clone
  (array.length).times {
  i = 0
  while i < array.length-1  do
       array[i,2] = array[i,2].reverse  if yield(array[i],array[i+1]) > 0
       i+=1
  end}
array
end

# a = (1..10).to_a.shuffle
# p a
# p bubble_sort_by(a) {|x,y| x > y ? 1 : -1 }
