# Ruby Building Blocks
## [An Exercise from The Odin Project](http://www.theodinproject.com/ruby-programming/building-blocks?ref=lnav)
The goal of this exercise is to gain a better understanding of Ruby through implementing three methods: caesar_cipher, stock_picker, and substrings.

### caesar_cipher(input_text, shift_factor)
Encrypts text via a simple Caesar Cipher. Each letter in the text is shifted by a specified number. For example, "a" with a shift factor of 3 is "d", and "a" with a shift factor of -3 is "x".

### stock_picker(prices)
Receives an array of Fixnums representing stock prices on consecutive days, and returns a two element array with the first element being the best day (index of the price) to buy and the second being the best day to sell in order to maximize profits.

Sample:

```
stock_picker([1, 2, 3, 4])
=> [0, 3]
```

### substrings(input_text, dictionary)
Returns a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

Sample:

```
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
=> {"below"=>1, "low"=>1}
```


# [Advanced Building Blocks](http://www.theodinproject.com/ruby-programming/advanced-building-blocks?ref=lnav)
bubble_sort and enumerable methods are from the following exercise: "Advanced Building Blocks".

### bubble_sort
Sorts an array by comparing each consecutive pair of elements and swapping them when the left element is greater than the right element. The method accepts an optional block specifying the method by which to sort the aray (e.g. <tt>{ |left, right| left.length - right.length }</tt> compares strings based on length). The result of the block is used to compare the elements in the same way as <=>.

### enumerable methods
