class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.event_id = params[:event_id]
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to event_url(params[:event_id])
    else
      raise
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to event_url(params[:event_id])
  end

end
