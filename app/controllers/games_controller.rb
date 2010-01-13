class GamesController < ApplicationController
  def index
    @games = Game.find_by_state(State.find(params[:id].to_i))
    render :layout => false
  end
end
