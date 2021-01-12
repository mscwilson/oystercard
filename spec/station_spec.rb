require "station"

describe Station do 

  it "has a name" do
    station = Station.new("name")
    expect(station).to respond_to(:name)

  end


  
end