desc "Send out data every second"
task :votes => :environment do

  while true do

    ActionCable.server.broadcast "votes", Vote.datum

    sleep 1

  end

end
