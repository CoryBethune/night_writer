require 'pry'
require './lib/brailleable'

class Dictionary
  include Brailleable

  attr_reader :dict, :braille

  def initialize
    @dict = {"a" => ["0.", "..", ".."],
             "b" => ["0.", "0.", ".."],
             "c" => ["00", "..", ".."],
             "d" => ["00", ".0", ".."],
             "e" => ["0.", ".0", ".."],
             "f" => ["00", "0.", ".."],
             "g" => ["00", "00", ".."],
             "h" => ["0.", "00", ".."],
             "i" => [".0", "0.", ".."],
             "j" => [".0", "00", ".."],
             "k" => ["0.", "..", "0."],
             "l" => ["0.", "0.", "0."],
             "m" => ["00", "..", "0."],
             "n" => ["00", ".0", "0."],
             "o" => ["0.", ".0", "0."],
             "p" => ["00", "0.", "0."],
             "q" => ["00", "00", "0."],
             "r" => ["0.", "00", "0."],
             "s" => [".0", "0.", "0."],
             "t" => [".0", "00", "0."],
             "u" => ["0.", "..", "00"],
             "v" => ["0.", "0.", "00"],
             "w" => [".0", "00", ".0"],
             "x" => ["00", "..", "00"],
             "y" => ["00", ".0", "00"],
             "z" => ["0.", ".0", "00"],
             "," => ["..", "0.", ".."],
             ";" => ["..", "0.", "0."],
             ":" => ["..", "00", ".."],
             "." => ["..", "00", ".0"],
             "!" => ["..", "00", "0."],
             "?" => ["..", "0.", "00"],
             "*" => [".. ..", ".0 .0", "0. 0."],
             "'" => ["..", "..", "0."],
             "-" => ["..", "..", "00"],
             " " => ["..", "..", ".."]
           }
    @braille = {["0.", "..", ".."]=>"a",
                 ["0.", "0.", ".."]=>"b",
                 ["00", "..", ".."]=>"c",
                 ["00", ".0", ".."]=>"d",
                 ["0.", ".0", ".."]=>"e",
                 ["00", "0.", ".."]=>"f",
                 ["00", "00", ".."]=>"g",
                 ["0.", "00", ".."]=>"h",
                 [".0", "0.", ".."]=>"i",
                 [".0", "00", ".."]=>"j",
                 ["0.", "..", "0."]=>"k",
                 ["0.", "0.", "0."]=>"l",
                 ["00", "..", "0."]=>"m",
                 ["00", ".0", "0."]=>"n",
                 ["0.", ".0", "0."]=>"o",
                 ["00", "0.", "0."]=>"p",
                 ["00", "00", "0."]=>"q",
                 ["0.", "00", "0."]=>"r",
                 [".0", "0.", "0."]=>"s",
                 [".0", "00", "0."]=>"t",
                 ["0.", "..", "00"]=>"u",
                 ["0.", "0.", "00"]=>"v",
                 [".0", "00", ".0"]=>"w",
                 ["00", "..", "00"]=>"x",
                 ["00", ".0", "00"]=>"y",
                 ["0.", ".0", "00"]=>"z",
                 ["..", "0.", ".."]=>",",
                 ["..", "0.", "0."]=>";",
                 ["..", "00", ".."]=>":",
                 ["..", "00", ".0"]=>".",
                 ["..", "00", "0."]=>"!",
                 ["..", "0.", "00"]=>"?",
                 [".. ..", ".0 .0", "0. 0."]=>"*",
                 ["..", "..", "0."]=>"'",
                 ["..", "..", "00"]=>"-",
                 ["..", "..", ".."]=>" "}
  end

  def braille_array(string) #turns a string into an array of unformated braille arrays
    unformatted_braille = Array.new
    string.each do |elem|
      unformatted_braille << @dict[elem]
    end
    unformatted_braille
  end


  def format_braille(arrays) #turns arrays from above method into a string of braille in one line
    first_row = ""
    second_row = ""
    third_row = ""
    braille = ""
    x = 0 #control variable
    until x > 2
      if x == 0
        arrays.each do |array|
          first_row += array[x]
        end
        x += 1
      elsif x == 1
        arrays.each do |array|
          second_row += array[x]
        end
        x += 1
      elsif x == 2
        arrays.each do |array|
          third_row += array[x]
        end
        x += 1
      end
    end
    first_row = first_row.chars.each_slice(80).map(&:join)
    second_row = second_row.chars.each_slice(80).map(&:join)
    third_row = third_row.chars.each_slice(80).map(&:join)
    return first_row, second_row, third_row
  end

  def braille_output(string) #turns the one big string variable from above into three lines of braille not to exceed 40 characters
    unform_braille = braille_array(string)
    formatted_braille = format_braille(unform_braille)
    c = formatted_braille[0].length #limit variable
    x = 0 #control variable
    braille = "" # variable to hold final version of the braille txt file
    until x > (c - 1)
      formatted_braille.each do |array|
        braille += array[x] + "\n"
        # binding.pry
      end
      x += 1
      # binding.pry
    end
    braille
  end


end
