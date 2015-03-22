require "spec_helper"
require "checkpercentage"


RSpec.describe Checkpercentage do
	 context "with no integer entered" do
	 	it "must be a number" do
	 		checkpercentage = Checkpercentage.new
	 		expect(Checkpercentage.findAmount(500, 333)).to be > 0
	 	end
	end
end

RSpec.describe Checkpercentage do
	 context "with no integer entered" do
	 	it "must be a number" do
	 		checkpercentage = Checkpercentage.new
	 		expect(Checkpercentage.findPercent(555, 333)).to be > 0
	 	end
	end
end

RSpec.describe Checkpercentage do
	 context "with no integer entered" do
	 	it "must be a number" do
	 		checkpercentage = Checkpercentage.new
	 		expect(Checkpercentage.findBase(333, 500)).to be > 0
	 	end
	end

		#expect(list).not_to be_empty
		#it { should be_kind_ofbe_emptyFixnum) }	
end