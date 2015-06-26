# Returns a hash listing each substring (case insensitive) that was found in
# the original string and how many times it was found.
#
# Sample:
#   dictionary = ["below","down","go","going","horn","how","howdy","it","i",
#                 "low","own","part","partner","sit"]
#
#   substrings("below", dictionary)
#   => {"below"=>1, "low"=>1}
# +input_text+:: The text in which to search for substrings given by dictinary.
# +dictionary+:: The substrings for which to search in input_text.
def substrings(input_text, dictionary)
  result = Hash.new(0)
  # create array from input_text and remove non letter characters.
  words = input_text.split
  words.map! { |word| word.match(/[a-zA-Z]+/).to_s }
  # increment the value of result[substring] by 1 if it is a substring of word.
  words.each do |word|
    dictionary.each do |substring|
      result[substring] += 1 unless word.downcase.match(/#{substring}/).nil?
    end
  end
  result
end
