class Cult
    
    @@all = []
    attr_accessor :name, :location, :founding_year, :slogan
#returns a String that is the cult's name
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    #returns an Array of all the cults
    def self.all
        @@all
    end

    #takes in an argument of a Follower instance and adds them to this cult's list of followers
    def recruit_follower(follower)
        BloodOath.new(self,follower)
    end

    #cult_population
    # returns an Integer that is the number of followers in this cult
    

    def follower_list
        BloodOath.all.select {|follower| follower.cult == self}.map(&:follower)
    end

    def cult_population
        follower_list.size
    end

    # Cult.find_by_name
    # takes a String argument that is a name and returns a Cult instance whose name matches that argument

    def self.find_by_name(name)
        Cult.all.select {|cult| cult.name == name}
    end

    # Cult.find_by_location
    # takes a String argument that is a location and returns an Array of cults that are in that location

    def self.find_by_location(location)
        Cult.all.select {|cult| cult.location == location}
    end
    # Cult.find_by_founding_year
    # takes an Integer argument that is a year and returns all of the cults founded in that year

    def self.find_by_founding_year(year)
        Cult.all.select {|cult| cult.founding_year == year}
    end

    # Cult#average_age
    # returns a Float that is the average age of this cult's followers

    def average_age
        total = follower_list.map(&:age).sum
        total / cult_population
    end
    # Cult#my_followers_mottos
    # prints out all of the mottos for this cult's followers

    def my_followers_mottos
        follower_list.map(&:life_motto)
    end

    # Cult.least_popular
    # returns the Cult instance who has the least number of followers :(

    def self.least_popular
        Cult.all.min_by {|cult| cult.cult_population}
    end
    # Cult.most_common_location
    # returns a String that is the location with the most cults
    
    def self.count_locations
        locations = {}

        self.all.each do |cult|
         if locations[cult.location]
           locations[cult.location] += 1
         elsif !locations[cult.location]
            locations[cult.location] = 1
          end
        end
    locations
    end
    
    def self.most_common_location
        location = count_locations.max_by {|location, count| count}
        location[0]    
    end
end


