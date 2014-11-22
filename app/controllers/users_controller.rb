class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    if User.count <= 50
      @user = User.new(user_params)
      if @user.save
        flash[:success] = I18n.t("welcome_app")
        redirect_to @user
      else
        render 'new'
      end
    else
        flash[:message] = I18n.t("max_users_reached")
        redirect_to root_path
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
