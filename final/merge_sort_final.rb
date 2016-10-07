require 'pry'

class MergeSort
  attr_accessor :completely_split_up, :sorted

  def initialize
    @completely_split_up = []
    @sorted = []
  end

  def sort(scrambled_letters)
    split_up(scrambled_letters)
    merge(completely_split_up)
  end

  def split_up(array)
    if array.length > 1
      half_the_array = array.length / 2
      halves = array.each_slice(half_the_array).to_a
      halves.each do |array|
        split_up(array)
      end
    else
      completely_split_up << array
      return completely_split_up
    end
  end

  def merge(array)
    merge_neighboring_pairs(array)

    if done_merging?       
      sorted.flatten!
    else
      merge(sorted)
    end

    return sorted
  end

  def merge_neighboring_pairs(array)
    array.each_slice(2) do |sub_array|
      collector = []
      number_of_elements = sub_array.flatten.length

      number_of_elements.times do
        sort_lowest_element(sub_array, collector)
      end

      sorted << collector
      sorted.reject! { |e| e.empty? }
    end
  end

  def done_merging?
    sorted.flatten.length == sorted.first.length
  end

  def sort_lowest_element(sub_array, collector)
    if sub_array[0].first.nil?
      collector << sub_array[1].shift
    elsif sub_array[1].first.nil?
      collector << sub_array[0].shift
    elsif sub_array[0].first < sub_array[1].first
      collector << sub_array[0].shift
    else
      collector << sub_array[1].shift
    end
  end

end

sorter = MergeSort.new
# test_array = [6, 4, 5, 5, 3, 5, 3, 6, 7, 1, 2]
test_array = ['d', 'b', 'c', 'a']
p sorter.sort(test_array)
