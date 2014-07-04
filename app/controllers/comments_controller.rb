class CommentsController < ApplicationController
  def index
    annotator = Annotator.find(params[:annotator_id])
    @comments = annotator.comments
  end

  def show
  end
end
