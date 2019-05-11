require "pry"
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" =>{
          :number => 0,
          :shoe =>16,
          :points =>22,
          :rebounds =>12,
          :assists =>12,
          :steals =>3,
          :blocks =>1,
          :slam_dunks =>1},
        "Reggie Evans" =>{
            :number =>30,
            :shoe =>14,
            :points =>12,
            :rebounds =>12,
            :assists =>12,
            :steals =>12,
            :blocks =>12,
            :slam_dunks =>7},
        "Brook Lopez" =>{
              :number =>11,
              :shoe =>17,
              :points =>17,
              :rebounds =>19,
              :assists =>10,
              :steals =>3,
              :blocks =>1,
              :slam_dunks =>15},
        "Mason Plumlee" =>{
                :number =>1,
                :shoe =>19,
                :points =>26,
                :rebounds =>12,
                :assists =>6,
                :steals =>3,
                :blocks =>8,
                :slam_dunks =>5},
        "Jason Terry" =>{
                  :number =>31,
                  :shoe =>15,
                  :points =>19,
                  :rebounds =>2,
                  :assists =>2,
                  :steals =>4,
                  :blocks =>11,
                  :slam_dunks =>1}
         }
    },
    :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Purple", "Turquoise"],
    :players => {
      "Jeff Adrien" =>{
        :number =>4,
        :shoe =>18,
        :points =>10,
        :rebounds =>1,
        :assists =>1,
        :steals =>2,
        :blocks =>7,
        :slam_dunks =>2},
      "Bismack Biyombo" =>{
          :number =>0,
          :shoe =>16,
          :points =>12,
          :rebounds =>4,
          :assists =>7,
          :steals =>7,
          :blocks =>15,
          :slam_dunks =>10},
      "DeSagna Diop" =>{
            :number =>2,
            :shoe =>14,
            :points =>24,
            :rebounds =>12,
            :assists =>12,
            :steals =>4,
            :blocks =>5,
            :slam_dunks =>5},
      "Ben Gordon" =>{
              :number =>8,
              :shoe =>15,
              :points =>33,
              :rebounds =>3,
              :assists =>2,
              :steals =>1,
              :blocks =>1,
              :slam_dunks =>0},
      "Brendan Haywood" =>{
                :number =>33,
                :shoe =>15,
                :points =>6,
                :rebounds =>12,
                :assists =>12,
                :steals =>22,
                :blocks =>5,
                :slam_dunks =>12}
    }
  }
}
end

# Write your code here!
def num_points_scored (player)
    name = find_the_players.fetch(player)
    name.fetch(:points)
end


def find_the_players
    game_hash[:away][:players].merge!(game_hash[:home][:players])
end

  #  go through both sets of teams, home and away until you find the name, then return the value of points for that player

def shoe_size(player)
  name = find_the_players.fetch(player)
  name.fetch(:shoe)
end

def team_colors(team)
    game_hash.collect do |l, td|
      if td[:team_name] == team
        colors = td[:colors]
        colors
      end
    end.flatten.compact
end

def teams
  game_hash.values

end

def team_names
    names = []
    teams.collect do |team|
      names << team.fetch(:team_name)
      end
    names
end

def player_numbers(team_name)
    jerseys = []

    teams.collect do |team_data|
     team_data.collect do |team, v|
          if v == team_name
          team_data[:players].collect do |person, info|
            jerseys << info[:number]
        end
       end
     end
    end
    jerseys
end

def player_stats(player)
    find_the_players.fetch(player)
end

def big_shoe_rebounds
     big_shoes = find_the_players.max_by {|player, stats| stats.fetch(:shoe)}
     big_shoes[1][:rebounds]
    # pull up the players info, then look for the largest shoe size, then find the number of rebounds for that player
end
