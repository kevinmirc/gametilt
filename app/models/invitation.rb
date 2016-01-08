class Invitation < ActiveRecord::Base
  belongs_to :game

  # def deliver
  #   account_sid = 'ACb94b74589e3833498ebf5ce5cc5e2360'
  #   auth_token = '6386c4bc1c60ccd05702b1c88068a5cc'
  #
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #
  #   params[:players].each do |player_id|
  #     Invitation.create(player_id: player_id, game_id: params[:game_id])
  #     game = Game.find(params[:game_id])
  #     host = Player.find(game.host)
  #     player = Player.find(player_id)
  #     #use twilio here
  #     @client.account.messages.create(
  #       :from => '+17272281142',
  #       :to => "+1" + player.phone,
  #       :body => "Hi, #{player.first_name}. #{host.name} invited you to #{game.name} at #{game.datetime} at #{game.location}.
  #       We need #{game.tilt_amount} players to play! Are you in? Reply \"I'm in\" to join the game."
  #     )
  #   end
  # end
end
