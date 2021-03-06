class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @comment = current_user.comments.build(entry_id: params[:entry_id], content: params[:comment][:content])
    if @comment.save
      flash[:success] = "Commented !"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  	@comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

   private

    def comment_params
      params.require(:comment).permit(:content, :entry_id)
    end
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
