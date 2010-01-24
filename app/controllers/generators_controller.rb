class GeneratorsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @game = Game.find(params[:id].to_i)
    if !@game.nil?
      all_nums = @game.generator.generate_random_numbers
      @numbers = all_nums[:numbers]
      @super = all_nums[:super_numbers]
      
      
    end
    render :layout => false
  end
end
