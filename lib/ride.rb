class Ride
    attr_reader :name, :distance, :loop, :terrain
    def initialize(hash)
        @name = hash[:name]
        @distance = hash[:distance]
        @loop = hash[:loop]
        @terrain = hash[:terrain]
    end

    def loop?
        @loop
    end

    def total_distance
        if loop?
            @distance
        else
            @distance * 2
        end
    end

end