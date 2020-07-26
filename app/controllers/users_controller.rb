class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:index]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user 
      redirect_to root_path, alert: 'アクセスできません。'
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user), notice: "ユーザー情報が更新されました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :text, :email)
  end

end
