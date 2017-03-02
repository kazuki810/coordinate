class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], code_id: comment_params[:code_id], user_id: current_user.id)
    redirect_to "/codes/#{@comment.code.id}"
  end

  private
  def comment_params
    params.permit(:text, :code_id)
  end
end
