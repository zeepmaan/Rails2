class UsersController < ApplicationController

  def index
    if user_signed_in? 
    @user = User.where('id LIKE?', "#{current_user.id}") #whereで配列で渡す
    end
  end

  def search
    @rooms = Room.search(params[:keyword],params[:free_keyword]) #room.rb内で.searchアクションを定義
  end

  def account
    @user = User.where('id LIKE?', "#{current_user.id}")
  end

  def profile
    @user = User.where('id LIKE?', "#{current_user.id}")
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:name, :introduction, :image))
      flash[:notice] = "ユーザーIDが『#{@user.id}』の情報を更新しました"
      redirect_to :users_index
    else
      render "edit"
    end
  end
end
