class ValidatePercentage < ActiveRecord::Base

	#1) what is  x% of y?
	def findAmount(rate, base)
		resultAmount = rate * base/100
		return resultAmount
	end 

	#2) x is what percentage of y?
	def findPercent(amount, base  )
		resultPercent = amount/base * 100
		return resultPercent
	end

	  #3) x is y% of what number?
	def findBase(amount, rate)
		resultBase = amount/rate *100
		return resultBase
	end
end
