class Public::PostsController < ApplicationController


  def index
    if params[:keyword].present?
      @posts = Post.where('title LIKE ?', "%#{params[:keyword]}%").page(params[:page]).per(9)
      @keyword = params[:keyword]
    else
      @posts = Post.page(params[:page]).per(9)
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @group_users = GroupUser.all
    @users = User.all


  end

  def edit
    @post = Post.find(params[:id])

  end

   def update
    submission = Post.find(params[:id])
    if submission.update(post_params)
      flash[:notice] = "You have updated post successfully."
      redirect_to posts_path
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end



  private

  def post_params
    params.require(:post).permit(:title, :description, :place, :address, :price, :belongings, :participants_list,:date,:time, :image, :user_id, :group_user_id)
  end


end
