class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/leaderboards' do
    @leader = Leaderboard.new
    erb :leaderboards
  end

  get '/games' do
    erb :"games/index"
  end

  get '/games/new' do
    erb :"games/new"
  end

  post '/games/new' do
    puts params
    #create and save
    #Game.create(name: params[], name: params[], name: params[], name: params[])
    # re route
  end

  get '/games/:id' do
    @game = Game.find(params[:id])
    erb :"games/show"
  end

  get '/players' do
    erb :"players/index"
  end

  get '/players/:id' do
    @player = Player.find(params[:id])
    erb :"players/show"
  end
end
