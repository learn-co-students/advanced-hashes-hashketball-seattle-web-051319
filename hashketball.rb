require "pry"

def game_hash
opponents = {
  :home => {
    :team_name => "Brooklyn Nets", 
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks =>12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets", 
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }
}
end

def num_points_scored(player_name)
  points_scored = 0
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :players
        attribute_values.each do |player, player_attributes|
          if player == player_name
            player_attributes.each do |player_attribute, value|
              points_scored = value if player_attribute == :points
            end
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(player_name)
  shoe_size = 0
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :players
        attribute_values.each do |player, player_attributes|
          if player == player_name
            player_attributes.each do |player_attribute, value|
              shoe_size = value if player_attribute == :shoe
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  colors = []
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :team_name && attribute_values == team_name
        game_hash[side][:colors].each do |color|
          colors << color
        end
      end
    end
  end
  colors
end

def team_names
  teams = []
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attributes, attribute_values|
      teams << attribute_values if team_attributes == :team_name
    end
  end
  teams
end

def player_numbers(team_name)
  team_jersey_numbers = []
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :team_name && attribute_values == team_name
        game_hash[side][:players].each do |player, player_attributes|
          player_attributes.each do |player_attribute, value|
            if player_attribute == :number
              team_jersey_numbers << value
            end
          end
        end
      end
    end
  end
  team_jersey_numbers
end

def player_stats(player_name)
  stats = {}
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :players
        attribute_values.each do |player, player_attributes|
          if player == player_name
            stats = player_attributes
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  max_shoe_size = 0
  rebounds = 0
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :players
        attribute_values.each do |player, player_attributes|
          player_attributes.each do |player_attribute, value|
            if player_attribute == :shoe && value > max_shoe_size
              max_shoe_size = value
            end
            rebounds = game_hash[side][team_attributes][player][:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored 
  best_shooter = ""
  max_points = 0
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :players
        attribute_values.each do |player, player_attributes|
          player_attributes.each do |player_attribute, value|
            if player_attribute == :points && value > max_points
              max_points = value
              best_shooter = player
            end
          end
        end
      end
    end
  end
  best_shooter
end

def winning_team
  team_wins = ""
  winning_points = 0
  
  game_hash.each do |side, team_data|
    max_points = 0
    team_data.each do |team_attributes, attribute_values|
      if team_attributes == :players
        attribute_values.each do |player, player_attributes|
          player_attributes.each do |player_attribute, value|
            if player_attribute == :points
              max_points = max_points + value
            end
          end
        end
      end
    end
    if max_points > winning_points
      winning_points = max_points
      team_wins = game_hash[side][:team_name]
    end
  end
  team_wins
end

def player_with_longest_name
  longest_name = ""
  longest_char_count = 0
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attribute, attribute_values|
      if team_attribute == :players
        attribute_values.each do |player, player_attributes|
          if player.length >= longest_char_count
            longest_char_count = player.length
            longest_name = player
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  had_most_steals = ""
  has_longest_name = player_with_longest_name
  max_steals = 0
  
  game_hash.each do |side, team_data|
    team_data.each do |team_attribute, attribute_values|
      if team_attribute == :players
        attribute_values.each do |player, player_attributes|
          player_attributes.each do |player_attribute, value|
            if player_attribute == :steals && value > max_steals
              max_steals = value
              had_most_steals = player
            end
          end
        end
      end
    end
  end
  true if had_most_steals == has_longest_name
end