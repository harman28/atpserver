module Suggester
	def suggest params
		where(params)
	end
end

class Player
	extend Suggester
end

class Match
	extend Suggester
end