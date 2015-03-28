class Checkpercentage

  #1) what is  x% of y?
  def self.find_amount(rate, base)
    result_amount = (rate.to_f.round(2) * base.to_f.round(2)/100).ceil
    return result_amount
  end 
  
  #2) x is what percentage of y?
  def self.find_percent(amount, base)
    result_percent = (amount.to_f.round(2)/base.to_f.round(2) * 100).ceil
    return result_percent
  end

  #3) x is y% of what number?
  def self.find_base(amount, rate)
   result_base = (amount.to_f.round(2)/rate.to_f.round(2) * 100).ceil
   return result_base
  end

end # End Module