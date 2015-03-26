require "gradingVZ/version"

class GradingVZ

 def self.runcheck(score)
	if score <= 4
	 	ans = "Failed!"
 	elsif (score > 4 && score <=7)
 		ans = "Pass!"
 	else
 		ans = "First class!"
 	end
 	return ans
 end
end # End Module