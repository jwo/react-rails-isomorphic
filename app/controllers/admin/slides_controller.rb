class Admin::SlidesController < ApplicationController

  before_action :authenticate_user!
end
