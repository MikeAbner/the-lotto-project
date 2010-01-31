class GamesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @games = State.fetch(params[:id].to_i).games
    render :layout => false
  end
end
