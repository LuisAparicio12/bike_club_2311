require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
    it 'exists' do
        biker = Biker.new("Kenny", 30)

        expect(biker).to be_an_instance_of Biker
    end

    it 'can have attributes' do
        biker = Biker.new("Kenny", 30)

        expect(biker.name).to eq("Kenny")
        expect(biker.max_distance).to eq(30)
        expect(biker.rides).to be_a Hash
        expect(biker.acceptable_terrain).to be_an Array
    end

    it 'can learn a terrain' do
        biker = Biker.new("Kenny", 30)

        biker.learn_terrain!(:gravel)
        biker.learn_terrain!(:hills)
        expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end

    it 'can have a log ride and a personal record' do
        biker = Biker.new("Kenny", 30)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
        biker.learn_terrain!(:gravel)
        biker.learn_terrain!(:hills)
        
        biker.log_ride(ride1, 92.5)
        biker.log_ride(ride1, 91.1)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)

        expect(biker.rides).to eq({ride1 => [92.5, 91.1], ride2 => [60.9, 61.6]})
        expect(biker.personal_record(ride1)).to eq(91.1)
        expect(biker.personal_record(ride2)).to eq(60.9)
    end

    it 'can another biker' do
        biker2 = Biker.new("Athena", 15)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

        expect(biker2.rides).to be_a Hash

        biker2.learn_terrain!(:gravel)
        biker2.learn_terrain!(:hills)
        biker2.log_ride(ride1, 95.0)
        biker2.log_ride(ride2, 65.0)

        expect(biker2.rides).to eq({ride2 => [65.0]})
    end
end