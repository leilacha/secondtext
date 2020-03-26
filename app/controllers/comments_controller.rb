# frozen_string_literal: true

# controller for Comment
class CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @comment_id = @comment.id
    @comment.destroy
    respond_to :js
  end
end
