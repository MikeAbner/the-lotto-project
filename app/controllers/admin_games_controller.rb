class AdminGamesController < ApplicationController
  before_filter :authenticate_user!
  def index
    if !current_user || !current_user.admin
     redirect_to '/'
    end
    @games = Game.all
  end
end
