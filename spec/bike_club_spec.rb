require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
    it 'exists' do
        bike_club = BikeClub.new("Colombia Club")

        expect(bike_club).to be_an_instance_of BikeClub
    end

    it 'can have an initialize' do
        bike_club = BikeClub.new("Colombia Club")

        expect(bike_club.name).to eq("Colombia Club")
        expect(bike_club.bikers).to be_an Array
    end

    it 'can add bikers' do
        bike_club = BikeClub.new("Colombia Club")
        biker = Biker.new("Kenny", 30)

        bike_club.add_biker(biker)
        expect(bike_club.bikers).to eq([biker])
    end

    it 'can have the count of the most rides' do
        bike_club = BikeClub.new("Colombia Club")
        biker = Biker.new("Kenny", 30)
        biker2 = Biker.new("Athena", 15)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
        
        bike_club.add_biker(biker)
        bike_club.add_biker(biker2)
        biker2.learn_terrain!(:hills)
        biker.learn_terrain!(:gravel)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)
        biker2.log_ride(ride1, 91.1)

        expect(bike_club.most_rides).to eq(biker)
    end
end