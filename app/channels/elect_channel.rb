class ElectChannel < ApplicationCable::Channel

   def vote(data)
     @vote = Vote.new #params.require(:vote).permit(:direction)
     @vote.direction = data.fetch("vote", {})["direction"]
     if @vote.save
       puts "Vote saved!"
     end
   end

 end
