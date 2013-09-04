class Card
  def initialize(num, back = 'some')
    @num, @back = num, back
  end

  def num; @num; end
  def back; @back; end

  def Card.generate_set
    [
      self.new(1),
      self.new(2),
      self.new(3),
      self.new(4),
      self.new(5),
      self.new(6),
      self.new(7),
      self.new(8),
      self.new(9),
      self.new(10),
      self.new(11),
      self.new(12),
      self.new(13),
      self.new(14),
      self.new(15),
      self.new(16),
      self.new(17),
      self.new(18),
      self.new(19),
      self.new(20),
      self.new(21),
      self.new(22),
      self.new(23),      
    ]
  end
end