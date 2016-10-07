class InsertionSort

  def sort(scrambled_elements)
    sorted_elements = []

    elements_to_sort = scrambled_elements.length
    
    elements_to_sort.times do
      first_element = scrambled_elements.shift

      sorted_elements << first_element
      last_element_to_be_sorted = sorted_elements.length - 1

      high_to_low_sorted = sorted_elements.reverse

      high_to_low_sorted.each_with_index do |element, index|
        break if index == last_element_to_be_sorted
        neighbor = high_to_low_sorted[index + 1]

        if element < neighbor
          swap_elements(high_to_low_sorted, index)
        end

        high_to_low_sorted
      end
      sorted_elements = high_to_low_sorted.reverse

    end

    p sorted_elements

  end

  def swap_elements(array, index)
    array[index], array[index + 1] = array[index + 1], array[index]
  end


  sorter = InsertionSort.new
  test_array = ['d', 'b', 'c', 'a']
  sorter.sort(test_array)

end
