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

  get '/play_game' do
    $game = Game.new(Player,Board)
    $coord = params[:coord]
    erb :play_game
  end

  get '/hit_or_miss' do
    erb :hit_or_miss
  end



  # get '/new_game' do
  #
  # end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
