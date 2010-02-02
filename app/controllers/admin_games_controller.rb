class AdminGamesController < ApplicationController
  before_filter :authenticate_user!
  def index
    if !current_user || !current_user.admin
     redirect_to '/'
    end
    if params[:state].blank?
      @games = Game.all
    else
      if params[:state][:id].blank?
        @games = Game.all
      else
        @games = State.fetch(params[:state][:id].to_i).games
      end
    end
  end
  def show
    @game = Game.find(params[:id])
  end
  def new
    @game = Game.new
    render :action => 'edit'
  end
  def edit
    @game = Game.find(params[:id])
  end
  def create
    @game = Game.new(params[:game])
    
    if !params[:state][:id].blank?
      @game.states << State.find(params[:state][:id].to_i)
    end
    
    if @game.save
      flash[:success] = "The game has been saved successfully!"
      if params[:commit] == 'Add State'
        redirect_to "/admin_games/edit/#{@game.id}"
      else
        redirect_to "/admin_games/show/#{@game.id}"
      end
    else
      flash[:error] = "The game could not be saved."
      redirect_to "/admin_games/edit/#{@game.id}"
    end
  end
  def update
    @game = Game.find(params[:id])
    
    if !params[:state][:id].blank?
      @game.states << State.find(params[:state][:id].to_i)
    end
    
    if @game.update_attributes(params[:game])
      flash[:success] = "The game has been updated successfully!"
      if params[:commit] == 'Add State'
        redirect_to "/admin_games/edit/#{@game.id}"
      else
        redirect_to "/admin_games/show/#{@game.id}"
      end
    else
      flash[:error] = "The game could not be updated."
      redirect_to "/admin_games/edit/#{@game.id}"
    end
  end
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to "/admin_games"
  end
end
