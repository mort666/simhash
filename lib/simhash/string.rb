class String
  def simhash(options={})
    split_by = options.delete(:split_by) || " "

    # Do the punctuation clean before the split..
    # You could argue this is not preserving the meaning doing so actually preserves the edge case where a hyphen is removed
    # resulting hash does not match the same string with a space in there before the split
    if options[:preserve_punctuation]
      Simhash.hash(self.split(split_by), options)
    else
      Simhash.hash(self.gsub(Simhash::PUNCTUATION_REGEXP, ' ') .split(split_by), options)
    end
  end

  def hash_vl_rb(length)
    return 0 if self == ""

    x = self.bytes.first << 7
    m = 1000003
    mask = (1<<length) - 1
    self.each_byte{ |char| x = ((x * m) ^ char.to_i) & mask }

    x ^= self.bytes.count
    x = -2 if x == -1
    x
  end

end
