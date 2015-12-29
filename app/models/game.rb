class Game < ActiveRecord::Base
  has_many :games_players
  has_many :players, through: :games_players

  def host_name
    Player.find(self.host).name
  end

  def player_count
    players.count
  end

  def status
    if tilted?
      "Game on!"
    else
      more_players_message
    end
  end

  private

  def more_players_message
    "We need #{players_needed} more players. <a href=\"#\">Invite your friends</a>"
  end

  def tilted?
    players.count >= tilt_amount ? true : false
  end

  def players_needed
    tilt_amount - player_count
  end
end
