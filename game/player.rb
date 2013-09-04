require "./card.rb"

class Player
  def initialize(name)
    @name = name
    @cards = []
  end

  def name; @name; end

  def add_cards(cards)
    unless cards.is_a? Array
      cards = [cards]
    end
    @cards += cards
  end

  def cards
    @cards
  end
end