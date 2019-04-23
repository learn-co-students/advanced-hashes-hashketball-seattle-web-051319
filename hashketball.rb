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
				"Bismak Biyombo" => {
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
					:number =>33,
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

def num_points_scored(player)
	game_hash.each do |location, team_data|
		if team_data[:players].include?(player)
			return team_data[:players][player][:points]
		end	
	end	
end	

def shoe_size(player)
	game_hash.each do |location, team_data|
		if team_data[:players].include?(player)
			return team_data[:players][player][:shoe]
		end
	end		
end	

def team_colors(team)
	game_hash.each do |location, team_data|
		return team_data[:colors] if team_data[:team_name] == team
	end	
end	

def team_names
	teams = []
	game_hash.each {|location, team_data| teams.push(team_data[:team_name])}
	teams
end

def player_numbers(team)
	numbers = []
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team
			team_data[:players].each do |player, stats|
				numbers.push(team_data[:players][player][:number])
			end
		end		
	end
	numbers
end

def player_stats(player)
	game_hash.each do |location, team_data|
		if team_data[:players].include?(player)
			return team_data[:players][player]
		end	
	end	
end

def big_shoe_rebounds
	shoe_size = 0
	rebounds = 0
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if stats[:shoe] > shoe_size
				shoe_size = stats[:shoe]
				rebounds = stats[:rebounds]
			end
		end	
	end
	rebounds	
end	

def most_points_scored
	high_points = 0
	high_player = ""
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if stats[:points] > high_points
				high_points = stats[:points]
				high_player = player				
			end	
		end	
	end
	high_player	
end	

def winning_team
	winner = ""
	total_points = 0
	game_hash.each do |location, team_data|
		team_points = 0
		team_data[:players].each do |player, stats|
			team_points += stats[:points]
		end
		if team_points > total_points
			total_points = team_points
			winner = team_data[:team_name]
		end	
	end
	winner
end	

def player_with_longest_name
	longest_name = ""
	name_length = 0
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if player.length > name_length
				name_length = player.length
				longest_name = player
			end	
		end	
	end
	longest_name	
end	

def long_name_steals_a_ton?
	high_steals = 0
	high_player = ""
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if stats[:steals] > high_steals
				high_steals = stats[:steals]
				high_player = player
			end	
		end	
	end	
	high_player == player_with_longest_name()
end