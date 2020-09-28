class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user 
        flash[:notice] = 'User was successfully created.' 
      else
        render :new 
      end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(user_params)
      if @user.save
        redirect_to @user 
        flash[:notice] = 'User was successfully updated.' 
      else
        render :new 
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
    flash[:notice] = 'Blog was successfully destroyed.' 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
