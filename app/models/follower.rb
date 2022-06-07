class Follower

    @@all = []
    attr_accessor :name, :age, :life_motto
    #returns a String that is the follower's name
    def initialize(name,age,life_motto)
        @name = name
        @age = age.to_f
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    # Follower#cults
    # returns an Array of this follower's cults

    def cults
        list = BloodOath.all.select {|blood_oath| blood_oath.follower == self}.map(&:cult)
        list.map(&:name) 
    end

    # Follower#join_cult
    # takes in an argument of a Cult instance and adds this follower to the cult's list of followers

    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    # Follower.of_a_certain_age
    # takes an Integer argument that is an age and returns an Array of followers who are the given age or older

    def self.of_a_certain_age(age)
        Follower.all.select {|follower| follower.age >= age}.map(&:name)
    end

    # Follower#my_cults_slogans
    # prints out all of the slogans for this follower's cults
    def my_cults_slogans
        slogans = BloodOath.all.select {|blood_oath| blood_oath.follower == self}.map(&:cult)
        slogans.map(&:slogan)
    end
    
    def following_cults
        my_cults_slogans.size
    end

    # Follower.most_active
    # returns the Follower instance who has joined the most cults

    def self.most_active
        Follower.all.max_by {|follower| follower.following_cults}
    end

    # Follower.top_ten
    # returns an Array of followers; they are the ten most active followers

    def self.top_ten
        Follower.all.max_by(10) {|follower| follower.following_cults}
    end
end
