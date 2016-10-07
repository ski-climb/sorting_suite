require 'pry'

class MergeSort
  attr_accessor :completely_split_up, :sorted_array

  def initialize
    @completely_split_up = []
    @sorted_array = []
  end

  def sort(scrambled_letters)
    cut_in_half(scrambled_letters)
    puts "scrambled array: #{scrambled_letters}"

    merge_together(completely_split_up)
    puts "and now it's sorted(ish): #{sorted_array}"

  end

  def cut_in_half(array)
    if array.length > 1
      half_the_array = array.length / 2
      both_halves = array.each_slice(half_the_array).to_a
      both_halves.each do |array|
        cut_in_half(array)
      end
    else
      completely_split_up << array
      return completely_split_up
    end
  end

  def merge_together(array)
    array.each_slice(2) do |element|
      working_array = []
      elements_to_combine = element.flatten.length
      elements_to_combine.times do
        if element.first.first == nil
          working_array << element.last.shift
        elsif element.last.first == nil
          working_array << element.first.shift
        elsif element.first.first < element.last.first
          working_array << element.first.shift
        else
          working_array << element.last.shift
        end
      end
      sorted_array << working_array
      sorted_array.reject! { |e| e.empty? }
    end

    if sorted_array.flatten.length == sorted_array.first.length
      sorted_array.flatten!
    else
      sorted_array.select! { |e| !e.empty? }
      merge_together(sorted_array)
    end

    return sorted_array

  end

end


sorter = MergeSort.new
# test_array = (1..90).to_a.shuffle!
test_array = ['d', 'b', 'c', 'a']
sorter.sort(test_array)



