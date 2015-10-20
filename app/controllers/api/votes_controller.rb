class Api::VotesController < ApplicationController

  before_action do
    request.format = :json
  end

  def create

    @vote = Vote.new params.require(:vote).permit(:direction)
    if @vote.save
      render status: 201, json: @vote
    else
      render status: 422, json: @vote.errors
    end
  end
end
