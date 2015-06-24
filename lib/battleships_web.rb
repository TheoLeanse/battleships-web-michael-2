require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  get '/' do
    $game = Game.new(Player,Board)
    erb :index
  end

  get '/new_game' do
    @player = params[:name]
    erb :new_game
  end

  get '/setup_game' do

    $game.player_2.place_ship(Ship.battleship, :A1, :vertically)
    # $game.player_2.place_ship(Ship.aircraft_carrier, :C1, :vertically)
    # $game.player_2.place_ship(Ship.cruiser, :E1, :vertically)
    # $game.player_2.place_ship(Ship.destroyer, :G1, :vertically)
    $game.player_2.place_ship(Ship.submarine, :I1, :vertically)

    redirect '/play_game'

  end

  get '/play_game' do
    @board = $game.opponent_board_view $game.player_1
    erb :play_game
  end

  post '/play_game' do
    @coord = params[:coord]
    # @status = "BEGIN!"
    if @coord && @coord != ""
      begin
        @status = $game.player_1.shoot @coord.to_sym
      rescue
        @status = 'You have already hit that coordinate or it is not on the board!'
      end
    end
    redirect '/victory' if $game.has_winner?
    @board = $game.opponent_board_view $game.player_1
    erb :play_game
  end

  get '/victory' do
    erb :victory
  end

  # for 2 player game

  get '/new_game_21' do
    # set up board for player 1
    erb :new_game_21
  end

  post '/new_game_21' do
    $game.player_1.place_ship(Ship.submarine, params[:sub_coords], params[:sub_dir])
    redirect '/new_game_22'
  end

  get '/new_game_22' do
    erb :new_game_22
  end

  post '/new_game_22' do
    $game.player_2.place_ship(Ship.submarine, params[:sub_coords], params[:sub_dir])
    redirect '/play_game_21'
  end

  get '/play_game_21' do
    erb :play_game_21
  end

  run! if app_file == $0
end
