class DNA
  def initialize(strand)
    @strand = strand.chars
  end

  def hamming_distance(other_strand)
    short, long = [@strand, other_strand.chars].sort_by(&:size)

    short.reject.with_index { |_, idx| short[idx] == long[idx] }.size
  end
end
