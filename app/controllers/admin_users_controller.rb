class AdminUsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    if !current_user || !current_user.admin
     redirect_to '/'
    end
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
    render :action => 'edit'
  end
  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:success] = "User has been saved successfully!"
      render :action => 'show'
    else
      flash[:error] = "User could not be saved!"
      render :action => 'edit'
    end
  end
  def update
    @user = User.find(params[:id])
    
    params[:user].delete(:password) if params[:user][:password] == ""
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation] == ""
    
    if @user.update_attributes(params[:user])
      flash[:success] = "User has been updated successfully!"
      render :action => 'show'
    else
      flash[:error] = "User could not be updated!"
      render :action => 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/admin_users'
  end
end
