class Public::PostCommentsController < ApplicationController
  def create
    submission = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = submission.id

    if comment.save
      redirect_to post_path(submission.id)
    else
      redirect_to post_path(submission.id)
    end

  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end


  def index
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments.where(post_id: @post.id).page(params[:page]).per(5)
  end

  def edit
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    if post_comment.update(post_comment_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to posts_path
    else
      render :edit
    end
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment).merge(post_id: params[:post_id])
  end
end
