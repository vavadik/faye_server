require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'
require "./game/game.rb"

class ServerAuth
  def initialize
    @game = Game.new
  end

  def incoming(message, callback)

    if message['channel'] == '/messages/public'
      case message['data']['action']
      when 'add_player'
        game.add_player(message['data']['username'])
      else
        message['error'] = 'unknown action'
      end
    end

    if message['channel'] == '/game'
      case message['data']['action']
      when 'add_player'
        @game.add_player(message['data']['username'])
      when 'start'
        unless @game.start
          message['error'] = 'not started!'
        end
      else
        message['error'] = 'unknown action'
      end
    end

    callback.call(message)
  end
end
faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
faye_server.add_extension(ServerAuth.new)
run faye_server