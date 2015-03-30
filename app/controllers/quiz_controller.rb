class QuizController < ApplicationController
	rescue_from "Exception", with: :errorHandling

	def errorHandling(exception)
		render text: exception.message
	end

	before_filter :authenticate_user! #ensure user is logged in

	$resultlist ||= Array.new # creates an array list to store all results
    

    def create
    	@quiz = Quiz.create(quiz_params)
    	@quiz.user = current_user
    	redirect_to :back
	end
	
	def index

	    $randomNumForQ1a = 10+rand(500)
	    $randomNumForQ1b = 10+rand(400)
	    $randomNumForQ2a = 200+rand(400)
	    $randomNumForQ2b = 10+rand(199)
	    $randomNumForQ3a = 200+rand(400)
	    $randomNumForQ3b = 10+rand(199)
		$randomNumForQ4a = 200+rand(400)
	    $randomNumForQ4b = 10+rand(199)
		$randomNumForQ5a = 2+rand(25)
	    $randomNumForQ5b = 1+rand(5)

	    $timesForQ1 =  $randomNumForQ1a * $randomNumForQ1b
	    $divideForQ2 = ($randomNumForQ2a.to_f/ $randomNumForQ2b.to_f).round(2)
		$divideForQ3 = ($randomNumForQ3a.to_f/ $randomNumForQ3b.to_f).round(2)
		$timesForQ4 =  $randomNumForQ4a * $randomNumForQ4b
	    $divideForQ5 = ($randomNumForQ5a.to_f/ $randomNumForQ5b.to_f).round(2)
	    
	end

	def validate

		def myMethod data
			if data.is_malformed?
				raise ArgumentError
			end
		end

		begin
		rescue NameError
			puts "Method does not exist or constant does not exist"
		end

		$resultlist.clear #clear resultlist before quiz starts
		@score = 0 #user points

		$final_score = ""

		#Question 1
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
		end

		#Question 2
		@inputFromUserQ2 = params[:userAnswerQ2].to_f.ceil
		@correctAnswerQ2 = Checkpercentage.find_percent($randomNumForQ2a, $randomNumForQ2b)

		if(@inputFromUserQ2 == @correctAnswerQ2)
			$resultlist.push("Q2: Your answer #{@inputFromUserQ2} is correct! ") 
			@score = @score +2
		else
			$resultlist.push("Q2: Your answer #{@inputFromUserQ2} is Incorrect. The correct answer is #{@correctAnswerQ2}. \n 
				To solve this math do the following:  \n
				Divide #{$randomNumForQ2a} with #{$randomNumForQ2b} = #{$divideForQ2}.  \n
				Then multipy it by 100 = #{$divideForQ2} * 100 = #{@correctAnswerQ2}% \n")	
		end
		
		#Question 3
		@inputFromUserQ3 = params[:userAnswerQ2].to_f.ceil
		@correctAnswerQ3 = Checkpercentage.find_percent($randomNumForQ3a, $randomNumForQ3b )

		if(@inputFromUserQ3 == @correctAnswerQ3)
			$resultlist.push("Q3: Your answer #{@inputFromUserQ3} is correct!") 
			@score = @score+2
		else
			$resultlist.push("Q3: Your answer #{@inputFromUserQ3} is Incorrect. The correct answer is #{@correctAnswerQ3}. \n 
				To solve this math do the following: \n
				Divide #{$randomNumForQ3a} with #{$randomNumForQ3b} = #{$divideForQ3}.  \n
				Then multipy it by 100 = #{$divideForQ3} * 100 = #{@correctAnswerQ3}% \n")	
		end
		
		#Question 4
		@inputFromUserQ4 = params[:userAnswerQ4].to_i
		@correctAnswerQ4 = Checkpercentage.find_amount($randomNumForQ4a, $randomNumForQ4b)
		
		if(@inputFromUserQ4 == @correctAnswerQ4)
			$resultlist.push("Q4: Your answer #{@inputFromUserQ4} is correct! ") 
			@score = @score+2
		else
			$resultlist.push("Q4: Your answer #{@inputFromUserQ4} is incorrect. The correct answer is #{@correctAnswerQ4}\n 
				To solve this math do the following: \n
				multiply #{$randomNumForQ4a} with #{$randomNumForQ4b} and then devide it by 100.\n
				#{$randomNumForQ4a} x #{$randomNumForQ4b} = #{$timesForQ4}\n
				then divide by 100, #{$timesForQ4}/100 = #{@correctAnswerQ4}\n") 
		end

		#Question 5
		@inputFromUserQ5 = params[:userAnswerQ5].to_i
		@correctAnswerQ5 = Power.value_power($randomNumForQ5a, $randomNumForQ5b)

		if(@inputFromUserQ5 == @correctAnswerQ5)
			$resultlist.push("Q5: Your answer #{@inputFromUserQ5} is correct! ") 
			@score = @score +2
		else
			$resultlist.push("Q5: WRONG! ")	
		end

		#simple_format(resultlist)
		$final_score = Gradescore.runcheck(@score)

		respond_to do |format|
		format.html { render :summary }
		end


	end # END of def

	def summary
	end


end
