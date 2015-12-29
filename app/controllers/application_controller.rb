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
    game = Game.create(name: params["title"], datetime: "#{params["date"]} #{params["time"]}", location: params["location"], tilt_amount: params["tilt_amount"], host: params["host_id"])
    redirect to("/games/#{game.id}")
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
