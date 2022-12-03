class Public::GroupUsersController < ApplicationController


  def create
    group_user = current_user.group_users.new(post_id: params[:post_id])
    group_user.save
    redirect_to post_path(group_user.post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    group_user = @post.group_users.find_by(user_id: current_user.id)
    group_user.destroy
    redirect_to request.referer
  end
end
