class QuizController < ApplicationController

	before_filter :authenticate_user! #ensure user is logged in

	$resultlist ||= Array.new # creates an array to store all results
    
	def index
	    $randomNumForQ1a = 10+rand(500)
	    $randomNumForQ1b = 10+rand(500)
	    $randomNumForQ2a = 200+rand(500)
	    $randomNumForQ2b = 10+rand(199)
	    $randomNumForQ3a = 200+rand(500)
	    $randomNumForQ3b = 10+rand(199)

	    $timesForQ1 =  $randomNumForQ1a * $randomNumForQ1b
	    $divideForQ2 = $randomNumForQ2a/ $randomNumForQ2b

	end

	def validate

		$resultlist.clear #clear resultlist before quiz starts
		@score = 0 #user points
		@inputFromUserQ1 = params[:userAnswerQ1].to_i
		@correctAnswerQ1 = Checkpercentage.find_amount($randomNumForQ1a, $randomNumForQ1b)
		
		if(@inputFromUserQ1 == @correctAnswerQ1)
			$resultlist.push("Q1: Your answer #{@inputFromUserQ1} is correct! ") 
			@score = @score+2
		else
			$resultlist.push("Q1: Your answer #{@inputFromUserQ1} is incorrect. The correct answer is #{@correctAnswerQ1}\n 
				To solve this math do the following: \n
				multiply #{$randomNumForQ1a} with #{$randomNumForQ1b} and then devide it by 100.\n
				#{$randomNumForQ1a} x #{$randomNumForQ1b} = #{$timesForQ1}\n
				then divide by 100, #{$timesForQ1}/100 = #{@correctAnswerQ1}\n") 
			@score = @score+1
		end

		#Question 2
		@inputFromUserQ2 = params[:userAnswerQ2].to_i
		@correctAnswerQ2 = Checkpercentage.find_percent($randomNumForQ2a, $randomNumForQ2b)

		if(@inputFromUserQ2 == @correctAnswerQ2)
			respond_to do |format|
				$resultlist.push("Q2: Your answer #{@inputFromUserQ2} is correct! <win points>") 
				@score = @score+2
				format.html { render :summary }
			end
		else
			respond_to do |format|
				$resultlist.push("Q2: Your answer #{@inputFromUserQ2} is Incorrect. The correct answer is #{@correctAnswerQ2}.\n 
					To solve this math do the following:/\n/
					Divide #{$randomNumForQ2a} with #{$randomNumForQ2b} = #{$divideForQ2}.\n
					Then multipy it by 100 = #{$divideForQ2} * 100 = #{@correctAnswerQ2}% \n")
				$resultlist.each do |s|
					s.gsub(/\n/, '<br />')
				end 
				@score = @score+1
				format.html { render :summary }

			end
		end
	

	@displayScore ||= Array.new 
	@final_score = Gradescore.runcheck(@score)
	@tomanucu = @final_score.to_s


	end # END of def

	def summary
	end

# class Gradescore2

# def self.runcheck(score)
# 	if score <= 4
# 		ans = "Failed!"
# 	elsif (score > 4 && score <=7)
# 		ans = "Pass!"
# 	else
#  		ans = "First class!"
#  	end
#  	return ans
#  end
# end # End Module

end
