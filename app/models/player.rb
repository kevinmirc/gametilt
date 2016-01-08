class Player < ActiveRecord::Base
  has_many :games_players
  has_many :games, through: :games_players
  has_many :invitations
  # has_many :invitations, through: :invitations

  def name
    first_name + " " + last_name
  end
end
