class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_group

  def new
    @post = Post.new
  end

  def create
    @post = @spot.posts.new(post_params)
    if @post.save
      redirect_to spot_path(@spot), notice: '投稿が送信されました'
    else
      @posts = @spot.posts.includes(:user)
      flash.now[:alert] = '投稿を入力してください。'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user 
      redirect_to root_path, alert: 'アクセスできません。'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to spot_post_path(@spot, @post), notice: '投稿が更新されました'
    else
      @posts = @spot.posts.includes(:user)
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to spot_path(@spot), notice: '投稿が削除されました'
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  def set_group
    @spot = Spot.find(params[:spot_id])
  end
end
