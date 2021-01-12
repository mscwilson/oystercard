require "oystercard"

describe Oystercard do

  describe "#balance" do

    it "has balance of 0 on initializing" do
      expect(subject.balance).to eq 0
    end

  end

  describe "#top_up" do

    it "takes one argument" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "increases balance" do
      expect{ subject.top_up(10) }.to change{ subject.balance }.by 10
    end
  end

    # before(:context) { subject.top_up(Oystercard::MAXIMUM_BALANCE) }

      describe "card with maximum balance" do

      it "raises error if balance limit is reached" do
        subject.top_up(Oystercard::MAXIMUM_BALANCE)
        expect { subject.top_up(1) }.to raise_error "Unable to top up as it would exceed balance limit (£#{Oystercard::MAXIMUM_BALANCE})"
      end
     end




  describe '#deduct' do

    it {is_expected.to respond_to(:deduct).with(1).arguments}

    it "decreases balance" do
      subject.top_up(10)
      deduction_amount = 1
      expect{ subject.deduct(deduction_amount) }.to change{ subject.balance }.by(-deduction_amount)
    end
  end

  describe "#touch_in" do

    it { is_expected.to respond_to :touch_in }

    it "sets in_journey? to be true" do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

  it "raises error if insufficient funds" do
    expect { subject.touch_in }.to raise_error "Insufficient funds"
  end


  end

  describe "#touch_out" do
    it { is_expected.to respond_to :touch_out }

    it "sets in_journey? to be false" do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

  describe "#in_journey?" do

    it { is_expected.to respond_to :in_journey? }

    it "is initially not in a journey" do
      expect(subject).not_to be_in_journey
    end
  end

end
