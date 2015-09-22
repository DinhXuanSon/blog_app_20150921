class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    debugged
    @comment = current_user.comments.build(comment_params)
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
      params.require(:comment).permit(:content)
      params[:comment][:entry_id] = 1
    end
    def correct_user
      @coment = current_user.comment.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
    end
end
