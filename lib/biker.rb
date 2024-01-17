class Biker
    attr_reader :name, :max_distance, :rides, :acceptable_terrain
    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrain = []
    end

    def learn_terrain!(terrain)
        @acceptable_terrain << terrain
    end

    def log_ride(ride, time)
        if @acceptable_terrain.include?(ride.terrain) && ride.distance <= @max_distance
            puts "Cannot log ride: Terrain or distance not correct."
        else
            @rides[ride] ||= []
            @rides[ride] << time
        end
    end 

    def personal_record(ride)
        @rides[ride]&.min || false
    end 
end