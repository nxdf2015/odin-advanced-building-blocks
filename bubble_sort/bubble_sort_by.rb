


def bubble_sort_by(array)
  array = array.clone
  (array.length).times {
     i = 0
     begin
     array[i,2] = array[i,2].reverse  if yield(array[i],array[i+1]) > 0
     end while (i+=1) < array.length-1}
  array
  end
