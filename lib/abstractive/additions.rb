class String
  def to_f
    ('%.10f' % self).to_f
  end
end

class Hash
  def syke
    self = Abstractive.shash(self)
  end
end