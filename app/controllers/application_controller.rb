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

  post '/games/invitations' do
    TestAccountSid = ''
    account_sid = ''
    auth_token = ''


    params[:players].each do |player_id|
      Invitation.create(player_id: player_id, game_id: params[:game_id])
      game = Game.find(params[:game_id])
      host = Player.find(game.host)
      player = Player.find(player_id)
      phone = "+1" + player.phone
      #use twilio here
      @client = Twilio::REST::Client.new account_sid, auth_token
      binding.pry
      @client.account.messages.create(
        :from => '+17272281142',
        :to => phone,
        :body => "Hi, #{player.first_name}. #{host.name} invited you to #{game.name} at #{game.datetime} at #{game.location}.\nWe need #{game.tilt_amount} players to play! Are you in? Reply \"I'm in\" to join the game."
      )
    end
    # POST "https://api.twilio.com/2010-04-01/Accounts/#{TestAccountSid}/SMS/Messages"
    erb :"invitation_message"
  end

  get '/games/:id' do
    @game = Game.find(params[:id])
    erb :"games/show"
  end

  post '/games/:id/delete' do
    @game = Game.delete(params[:id])
    redirect to("/games")
  end

  get '/games/:id/edit' do
    @game = Game.find(params[:id])
    erb :"games/edit"
  end

  post '/games/:id/edit' do
    puts params
    game = Game.find(params[:id])

    #if time and date empty make it eaqual to whatever it is in the db
    time = params["time"]
    date = params["date"]
    params["time"] == "" && params["date"] == "" ? datetime = game.datetime : datetime = "#{date} #{time} UTC"
    #need more code for if only time is empty and date is submited (vice versa)
    game.update(name: params["name"], datetime: datetime, location: params["location"], tilt_amount: params['tilt_amount'], host: params["host_id"])
    redirect to("/games/#{game.id}")
  end

  get '/players' do
    erb :"players/index"
  end

  get '/players/new' do
    erb :"players/new"
  end

  post '/players/new' do
    binding.pry
    player = Player.create(first_name: params["first_name"], last_name: params["last_name"], phone: params["phone"])
    redirect to("players/#{player.id}")
  end

  get '/players/:id' do
    @player = Player.find(params[:id])
    erb :"players/show"
  end
end
