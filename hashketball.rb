
# Write your code here!
require "pry"
def game_hash
	game_hash = {
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
					:blocks => 12,
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
		:away =>{
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players =>{
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


def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    	team_data.each do |attribute, data|
		#are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
			binding.pry

			#what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
			data.each do |data_item|
				binding.pry
	      	end
    	end
  	end
  good_practices
end

def num_points_scored(player_name)
	points_scored = 0
	game_hash.each do |location, team_data|
    #home/away & the rest of the data
    	team_data.each do |attribute, data|
    		#team name/ colors/ players
    		# binding.pry
    		if attribute == :players
    			data.each do |player, player_attributes|
    				if player == player_name
    					player_attributes.each do |player_attribute, value|
    					# binding.pry
    						if player_attribute == :points
    							points_scored = value
    							
    						end
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
		game_hash.each do |location, team_data|
	    #home/away & the rest of the data
	    	team_data.each do |attribute, data|
	    		#team name/ colors/ players
	    		# binding.pry
	    		if attribute == :players
	    			data.each do |player, player_attributes|
	    				if player == player_name
	    					player_attributes.each do |player_attribute, value|
	    					# binding.pry
	    						if player_attribute == :shoe
	    							shoe_size = value
	    							
	    						end
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
	#returns array --> team colors
	game_hash.each do |location, team_data|
	    #home/away & the rest of the data
	    team_data.each do |attribute, data|
    		#team name/ colors/ players
    		if attribute == :team_name && data == team_name
    			game_hash[location][:colors].each do |color|
    				colors << color
    			end
    		end
	    end
	end
	colors
end

def team_names
	teams = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			teams << data if attribute == :team_name
		end
	end
	teams
end

def player_numbers(team_name)
	#returns array of jersers for team
	jersey_numbers = []
	game_hash.each do |location, team_data|
		#home/away, data(...)
		team_data.each do |attribute, data|
			#team name, colors, players/ data(...)
			if attribute == :team_name && data == team_name
				game_hash[location][:players].each do |name, player_attributes|
					player_attributes.each do |player_attribute, value|
						if player_attribute == :number
							jersey_numbers << value
						end
					end
				end
			end
		end
	end
	jersey_numbers
end

def player_stats(player_name)
	stats = {}
	game_hash.each do |location, team_data|
		#home/away, data(...)
		team_data.each do |attribute, data|
			#team name, colors, players/ data(...)
			if attribute == :players 
				data.each do |name, player_data|
					if name == player_name
						stats = player_data
					end
				end
			end
		end
	end
	stats 
end

def big_shoe_rebounds
	#return rebound # for player with largest shoe size
	#big shoe var << big shoe size
	#return rebound #
	rebounds = 0
	shoe_size = 0
	game_hash.each do |location, team_data|
		#home/away, data(...)
		team_data.each do |attribute, data|
			#team name, colors, players/ data(...)
			if attribute == :players 
				data.each do |name, player_data|
					player_data.each do |player_data, stat|
						if player_data == :shoe && stat > shoe_size
							shoe_size = stat 
							# binding.pry
							rebounds = game_hash[location][attribute][name][:rebounds]
						end
					end
				end
			end
		end
	end
	rebounds
end






