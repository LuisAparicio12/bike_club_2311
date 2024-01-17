class Ride
    attr_reader :name, :distance, :loop, :terrain
    def initialize(hash)
        @name = hash[:name]
        @distance = hash[:distance]
        @loop = hash[:loop]
        @terrain = [:terrain]
    end
end