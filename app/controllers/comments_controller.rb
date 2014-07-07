class CommentsController < ApplicationController
  def index
    annotator = Annotator.find(params[:annotator_id])
    @comments = annotator.comments
  end

  # this should be activated only by a json request (as specified in routes)
  def show
    annotator = Annotator.find_by_name(params[:annotator])
    comments = Comment.where(annotator_id: annotator.id)
    comment = comments.find_by_number(params[:comment_number])
    respond_to do |format|
      format.json { render json: comment }
    end
  end
end
