class UsersController < ApplicationController
  
  def index
    
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = t("users.welcome_message")
      redirect_to @user
    else
      render :new
    end
  end
  
end