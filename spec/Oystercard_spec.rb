require "oystercard"

describe Oystercard do

  describe "#balance" do

    it "has balance of 0 on initializing" do
      expect(subject.balance).to eq 0
    end

  end
  
end
