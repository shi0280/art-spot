class CommentsController < ApplicationController
  def new
    @spot = Spot.find(params[:spot_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
