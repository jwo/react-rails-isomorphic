class SlidesChannel < ApplicationCable::Channel
   def subscribed
     stream_from "slides"
   end

   def slides(data)
     # Got advanced or changed
     ActionCable.server.broadcast "slides", data.slice("indexh", "indexv", "indexf")
   end
 end
