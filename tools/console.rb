require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


magician = Cult.new("Magician", "Los Angeles", 1987, "We The Magicians")
wizard = Cult.new("Wizard", "Los Angeles", 1990, "Second To None")
oz = Cult.new("Of Oz", "San Francisco", 1900, "Oz The Best")

sungwoo = Follower.new("Sungwoo", 27, "No Motto")
mark = Follower.new("Mark", 19, "Fake Motto")
malcom = Follower.new("Malcom", 20, "Motto1")
jared = Follower.new("Jared", 26, "Motto2")
bogdan = Follower.new("Boddan", 30, "Motto3")
david = Follower.new("David", 40, "Why Motto")
chris = Follower.new("Chris", 25, "Hi Motto")
kavid = Follower.new("kavid", 29, "Whey Motto")
johnny = Follower.new("Johnny", 45, "Oldest Motto")

magician.recruit_follower(kavid)
magician.recruit_follower(mark)
magician.recruit_follower(malcom)
magician.recruit_follower(jared)
wizard.recruit_follower(bogdan)
wizard.recruit_follower(kavid)
oz.recruit_follower(david)
oz.recruit_follower(mark)
oz.recruit_follower(kavid)
oz.recruit_follower(bogdan)
oz.recruit_follower(sungwoo)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits