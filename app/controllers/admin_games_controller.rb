class AdminGamesController < ApplicationController
  before_filter :authenticate_user!
  def index
    if !current_user || !current_user.admin
     redirect_to '/'
    end
    @games = Game.all
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
    
    if @game.save
      flash[:success] = "The game has been saved successfully!"
      render :action => 'show'
    else
      flash[:error] = "The game could not be saved."
      render :action => 'edit'
    end
  end
  def update
    @game = Game.find(params[:id])
    
    if @game.update_attributes(params[:game])
      flash[:success] = "The game has been updated successfully!"
      render :action => 'show'
    else
      flash[:error] = "The game could not be updated."
      render :action => 'edit'
    end
  end
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to "/admin_games"
  end
end
