require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  get '/' do
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    erb :new_game
  end

  get '/setup_game' do
    ship =
    game = Game.new Player, Board
    game.player_1.place_ship
    erb :setup_game
  end



  # get '/new_game' do
  #
  # end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
