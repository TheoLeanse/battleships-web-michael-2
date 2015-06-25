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
    @status = params[:status]
    @board = $game.own_board_view $game.player_1
    erb :new_game_21
  end

  post '/new_game_21' do
    begin
      $game.player_1.place_ship(Ship.submarine, params[:sub_coord], params[:sub_dir])
      $game.player_1.place_ship(Ship.battleship, params[:bat_coord], params[:bat_dir])
      $game.player_1.place_ship(Ship.destroyer, params[:des_coord], params[:des_dir])
      $game.player_1.place_ship(Ship.cruiser, params[:cru_coord], params[:cru_dir])
      $game.player_1.place_ship(Ship.aircraft_carrier, params[:car_coord], params[:car_dir])
    rescue
      redirect '/new_game_21?status=invalid'
    end
    redirect '/new_game_22'
  end

  get '/new_game_22' do
    @status = params[:status]
    @board = $game.own_board_view $game.player_2
    erb :new_game_22
  end

  post '/new_game_22' do
    begin
      $game.player_2.place_ship(Ship.submarine, params[:sub_coord], params[:sub_dir])
      $game.player_2.place_ship(Ship.battleship, params[:bat_coord], params[:bat_dir])
      $game.player_2.place_ship(Ship.destroyer, params[:des_coord], params[:des_dir])
      $game.player_2.place_ship(Ship.cruiser, params[:cru_coord], params[:cru_dir])
      $game.player_2.place_ship(Ship.aircraft_carrier, params[:car_coord], params[:car_dir])
    rescue
      redirect '/new_game_22?status=invalid'
    end
    redirect '/play_game_21'

  end

  get '/play_game_21' do
    @message = 'Player 1, choose coordinate to fire!'
    @board = $game.opponent_board_view $game.player_1
    erb :play_game_21
  end

  post '/play_game_21' do
    @result = $game.player_1.shoot(params[:hit_coord].to_sym)
    @board = $game.opponent_board_view $game.player_1
    redirect '/victory2' if $game.has_winner?
    if @result == :hit || @result == :sunk
      @message = 'Well done! That was a hit!'
    else
      @message = 'Sorry, that was a miss!'
    end
    erb :play_game_21
  end

  get '/play_game_22' do
    @message = 'Player 2, choose coordinate to fire!'
    @board = $game.opponent_board_view $game.player_2
    erb :play_game_22
  end

  post '/play_game_22' do
    @result = $game.player_2.shoot(params[:hit_coord].to_sym)
    @board = $game.opponent_board_view $game.player_2
    redirect '/victory2' if $game.has_winner?
    if @result == :hit || @result == :sunk
      @message = 'Well done! That was a hit!'
    else
      @message = 'Sorry, that was a miss!'
    end
    erb :play_game_22
  end

  get '/victory2' do
    @winner = 'Player 1' if $game.player_1.winner?
    @winner = 'Player 2' if $game.player_2.winner?
    erb :victory2
  end

  run! if app_file == $0
end
