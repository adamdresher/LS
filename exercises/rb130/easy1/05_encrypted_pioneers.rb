# The following are encrypted names influential people in the computer science
# field.  The encryption is Rot13, a fairly simple and weak form of encryption.

PIONEERS = ["Nqn Ybirynpr",
            "Tenpr Ubccre",
            "Nqryr Tbyqfgvar",
            "Nyna Ghevat",
            "Puneyrf Onoontr",
            "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
            "Wbua Ngnanfbss",
            "Ybvf Unvog",
            "Pynhqr Funaaba",
            "Fgrir Wbof",
            "Ovyy Tngrf",
            "Gvz Orearef-Yrr",
            "Fgrir Jbmavnx",
            "Xbaenq Mhfr",
            "Fve Nagbal Ubner",
            "Zneiva Zvafxl",
            "Lhxvuveb Zngfhzbgb",
            "Unllvz Fybavzfxv",
            "Tregehqr Oynapu"]

CHARS = ('a'..'z').to_a

# de/encrypts individual characters
def rot13_letter(char)
  is_upcase = (char == char.upcase) ? true : false
  char = char.downcase

  if CHARS.include? char
    char_idx = CHARS.find_index char
    char = CHARS[char_idx - 13]
  end

  is_upcase ? char.upcase : char
end

# de/encrypts text
def rot13(text)
    text.split('').map { |char| rot13_letter(char) }.join
end

# decrypts and outputs list
PIONEERS.each do |pioneer|
  puts rot13(pioneer)
end
