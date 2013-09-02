require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'
require "./game/player.rb"

# require File.expand_path('../config/initializers/faye_token.rb', __FILE__)

class ServerAuth
  def incoming(message, callback)
    # if message['channel'] !~ %r{^/meta/}
    #   if message['ext']['auth_token'] != FAYE_TOKEN
    #     message['error'] = 'Invalid authentication token'
    #   end
    # end
    if message['channel'] == '/messages/public'
      case message['data']['action']
      when 'login'

      when 'message'

      else
        message['error'] = 'unknown action'
      end
    end
    callback.call(message)
  end
end
faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 5)
faye_server.add_extension(ServerAuth.new)
run faye_server