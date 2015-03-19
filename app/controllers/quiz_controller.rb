class QuizController < ApplicationController
require 'checksomething'

	$results1 = [""]
	$results2 = [""]

	$resultlist ||= Array.new
    
	def index

	    $randomNumForQ1a = 100+rand(10000);
	    $randomNumForQ1b = 100+rand(10000);
	    $randomNumForQ2a = 100+rand(10000);
	    $randomNumForQ2b = 100+rand(10000);
	    $randomNumForQ3a = 100+rand(10000);
	    $randomNumForQ3b = 100+rand(10000);
	end

	def validate
		#byebug
		#if (params[:userAnswer].to_i > 0) 
		@inputFromUserQ1 = params[:userAnswerQ1].to_i
		@callModel = ValidatePercentage.new
		@correctAnswerQ1 = Checkpercentage.findAmount($randomNumForQ1a, $randomNumForQ1b)
		
		if(@inputFromUserQ1 == @correctAnswerQ1)
			respond_to do |format|
				$resultlist.push("Answer is correct") 
				format.html { render :summary }
			end
		else
			respond_to do |format|
				$resultlist.push("Answer is Incorrect") 
				format.html { render :summary }
			end
		end

		#Question 2
		@inputFromUserQ2 = params[:userAnswerQ2].to_i
		@callModel = ValidatePercentage.new
		@correctAnswerQ2 = @callModel.findPercent($randomNumForQ2a, $randomNumForQ2b)

		if(@inputFromUserQ2 == @correctAnswerQ2)
			$resultlist.push("Answer is correct") 
		else
			$resultlist.push("Answer is Incorrect")
		end

	end

	def summary
	end



end
