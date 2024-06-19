def bubble_sort(array)

  # track number of loops made
  loops_made = 0

  loop do
    swaps_made = false
    
    # deduct loops made from the iterations to optimize
    # since n-right-most elements in the array after n-loops will already have been sorted
    (0...array.length - 1 - loops_made).each do |index|
      if array[index] > array[index + 1]
        # switch the positions of the two elements
        array[index], array[index + 1] = array[index + 1], array[index]
        # set swaps_made to true, indicating that we need to re-check it in another loop
        swaps_made = true
      end
    end

    # break out of the loop if no more swaps were made (everything is sorted)
    break unless swaps_made

    loops_made += 1
  end
  array
end

p(bubble_sort([4, 3, 78, 2, 0, 2]))