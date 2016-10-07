class InsertionSort
  attr_accessor :sorted_elements 
  attr_reader :scrambled_elements

  def initialize
    @sorted_elements = []
  end

  def sort(scrambled_elements)
    @scrambled_elements = scrambled_elements
    number_of_elements_to_sort = scrambled_elements.length
    
    number_of_elements_to_sort.times do
      add_element_for_sorting
      sort_an_element_into_array
    end

    return sorted_elements
  end

  def add_element_for_sorting
    first_element = scrambled_elements.shift
    sorted_elements << first_element
  end

  def sort_an_element_into_array
    last_index_to_be_sorted = sorted_elements.length - 2
    high_to_low_sorted = sorted_elements.reverse

    compare_element_with_neighbor(last_index_to_be_sorted, high_to_low_sorted)

    self.sorted_elements = high_to_low_sorted.reverse
  end

  def compare_element_with_neighbor(last_index_to_be_sorted, high_to_low_sorted)
    high_to_low_sorted.each_with_index do |element, index|
      break if index > last_index_to_be_sorted
      neighbor = high_to_low_sorted[index + 1]

      if element < neighbor
        swap_elements(high_to_low_sorted, index)
      else
        break
      end

      high_to_low_sorted
    end
  end

  def swap_elements(array, index)
    array[index], array[index + 1] = array[index + 1], array[index]
  end
end

sorter = InsertionSort.new
# test_array = (1..100).to_a.shuffle! + (1..100).step(3).to_a.shuffle!
test_array = ['d', 'b', 'c', 'a']
p sorter.sort(test_array)
