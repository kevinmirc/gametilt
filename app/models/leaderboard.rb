class Leaderboard
  def super_host
    #most hosted games that tilted
    a = Game.all.collect {|i| i.host }
    freq = a.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    Player.find(freq.keys.first).name
  end

  def top_dog
    #player that is most active (has been in the most games that tilted)
    "Evan Brady"
  end

  def too_cool
    #player that has the largest Invite to playing margin (invited but never playes)
    "Kevin Mircovich"
  end

  def game_of_the_month
    #Most attendees for a game that month
    "Football at the commons with 47 players"
  end
end
