class BubbleSort

  def sort(array)
    last_index_for_comparison = array.length - 2

    array.each_with_index do |element, index|
      break if index > last_index_for_comparison
      neighbor = array[index + 1]

      if element > neighbor
        swap_element_with_neighbor(array, index)
        sort(array)
      end
    end
    return array
  end

  def swap_element_with_neighbor(array, index)
    array.insert(index, array.delete_at(index + 1))
  end

end

sorter = BubbleSort.new
# test_array = (1..10).to_a.shuffle! + (1..10).step(3).to_a.shuffle!
test_array = ['d', 'b', 'c', 'a']
p sorter.sort(test_array)
