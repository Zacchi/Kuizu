require "spec_helper"
require "checkpercentage"

RSpec.describe Checkpercentage  do
  context "number is bigger than 0" do
    it "must be bigger than" do
      expect(Checkpercentage.find_percent(555, 123)).to be > 0
    end
  end
end

RSpec.describe Checkpercentage  do
  context "number is correct" do
    it "is correct" do
      expect(Checkpercentage.find_amount(250, 135)).to equal(338)
    end
  end
end

RSpec.describe Checkpercentage  do
  context "number is correct" do
    it "is correct" do
      expect(Checkpercentage.find_percent(250, 135)).to equal(186)
    end
  end
end