class ElectChannel < ApplicationCable::Channel

   def vote(data)
     @vote = Vote.new
     @vote.direction = data.fetch("vote", {})["direction"]
     @vote.save
   end

 end
