class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
