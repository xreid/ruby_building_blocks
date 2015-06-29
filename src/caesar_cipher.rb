# Encrypts text via a simple Caesar Cipher. Each letter in the text is shifted
# by a specified number. For example, "a" with a shift factor of 3 is "d", and
# "a" with a shift factor of -3 is "x".
# +input_text+:: Text to be encrypted
# +shift+:: Amount by which each character should be shifted
def caesar_cipher(input_text, shift_factor)
  if input_text.class != String || shift_factor.class != Fixnum
    return "Please enter a valid String (e.g. 'Sample text.') and Fixnum (e.g. 5)."
  end
  letters = ('a'..'z').to_a
  input_characters = input_text.split('')
  input_characters.map! do |character|
    index = letters.index(character.downcase)
    # ignore all non letter characters
    if !letters.include?(character.downcase)
      character
    else
      # Account for index + shift_factor exceeding the bounds of letters w/ %.
      new_position = (index + shift_factor) % letters.size
      # maintain letter casing
      if character == character.upcase
        letters[new_position].upcase
      else
        letters[new_position]
      end
    end
  end
  input_characters.join
end
