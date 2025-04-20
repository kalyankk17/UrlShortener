module UrlShortener
  class Base62Converter
    ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".chars
    BASE = ALPHABET.size

    # Encode a number into Base62
    def self.base62_encode(num)
      return "0" if num == 0
      encoded = ""
      while num > 0
        encoded = ALPHABET[num % BASE] + encoded
        num /= BASE
      end
      encoded
    end

    # Convert a string to a numeric value
    def self.string_to_number(str)
      # Combine ASCII values of characters into a single numeric value
      str.each_char.reduce(0) { |sum, char| sum * 256 + char.ord }
    end

    # Convert a string to a 7-character Base62 string
    def self.string_to_base62(str)
      numeric_value = string_to_number(str) # Convert string to a numeric value

      # Limit the numeric value to fit within 7 Base62 characters
      limited_value = numeric_value % (BASE**7) # Ensure the number fits within 7 Base62 characters

      # Encode the limited numeric value into Base62
      base62_encode(limited_value).rjust(7, "0") # Pad with zeros if shorter than 7 characters
    end
  end
end

