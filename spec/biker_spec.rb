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
end