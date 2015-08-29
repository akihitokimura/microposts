class UsersController < ApplicationController
before_action :set_user, only:[:show, :edit, :update, :following, :follower]

  def show
    @microposts = @user.microposts.page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path , notice: 'Profileを編集しました'
    else
      render 'edit'
    end
  end
  
  def following
    @following_users = @user.following_users

  end

  def follower
    @follower_users = @user.follower_users

  end
  
  
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :age)
  end
  
  def set_user
  @user = User.find(params[:id])
  end
  

end


