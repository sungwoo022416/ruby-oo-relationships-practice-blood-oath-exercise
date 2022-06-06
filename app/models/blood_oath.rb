require 'time'

class BloodOath
    attr_accessor :cult, :follower, :initiation_date

    @@all = []

    def initialize(cult, follower, initiation_date="#{Time.now.year}-#{Time.now.month}-#{Time.now.day}")
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

#     BloodOath.first_oath
# returns the Follower instance for the follower that made the very first blood oath

    def self.first_oath
        first_follower = BloodOath.all.sort_by {|oath| Time.parse(oath.initiation_date)}
        first_follower[0].follower
    end

end