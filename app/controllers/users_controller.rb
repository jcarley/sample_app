class UsersController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only =>   [:destroy]
  before_filter :avoid_sign_in, :only => [:new, :create]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    #raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user, :flash => { :success => "Welcome to the Sample App!" }
    else
      @title = "Sign up"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :flash => { :success => "User removed successfully" }
  end

  private

  def correct_user
    @user = User.find params[:id]
    redirect_to(root_path) unless current_user?(@user) 
  end

  def admin_user
    @user = User.find(params[:id])
    redirect_to root_path if (!current_user.admin? || current_user?(@user))
  end

  def avoid_sign_in
    redirect_to root_path if signed_in?
  end

end
