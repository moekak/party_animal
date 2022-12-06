class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]


  def show
    @user = current_user
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @post_group_users = GroupUser.where(user_id: current_user.id)
    @posts = Post.where(user_id: current_user.id)
  end



  def edit
    @user = current_user

  end

  def update
    user = current_user
    if user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end





  private
  def user_params
    params.require(:user).permit(:email, :name, :image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
