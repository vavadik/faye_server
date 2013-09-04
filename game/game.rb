require "./player.rb"
require "./card.rb"

class Game
  def initialize
    @players = []
    @card_set = []
    @desc = []
    @trump = nil
  end

  def start
    if @players.count < 2 || @players.count > 6
      p 'not started'
      return
    end
    @card_set = Card.generate_set.shuffle
    @trump = @card_set[-1].dup
    puts 'game started!'
    @players.each do |player|
      player.add_cards(@card_set.take(6))
      @card_set = @card_set.drop(6)
    end
  end

  def add_player(name)
    @players << Player.new(name) if name.is_a?(String) && @players.count < 6
  end

  def players
    @players
  end

  def action(act)
    
  end
end

g = Game.new
g.add_player('vadik')
g.add_player('vadik')
g.start