class Vote < ActiveRecord::Base

  def self.datum
    [{
      "values": Vote.by_the_second,
      "key": "Average",
      "color": '#ff7f0e'
    }]

  end

  def self.by_the_second
    # Groups by the second. Maybe we want to group every 5 seconds?

    by_the_second = Vote
                      .where("created_at >= ?",  5.minutes.ago)
                      .group_by{|v| ((Time.now.utc - v.created_at.utc)).to_i }

    values = (0..300).to_a.map do |seconds_ago|
      votes = by_the_second.fetch(seconds_ago, [])

      yay,nay = votes.partition(&:direction)

      if nay.any?
        percentage = (yay.count.to_f/votes.count) * 100
      elsif yay.any?
        percentage = 100
      else
        percentage = 0

      end
      {x: seconds_ago, y: percentage.to_i}
    end

  end
end
