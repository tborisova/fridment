class CommentsController < ApplicationController

  def index
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comments = Comment.where(issue_id: params[:issue_id])
  end

  def new 
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comment = Comment.new
  end

  def show 
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comment = Comment.find params[:id]
  end

  def edit
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comment = Comment.find params[:id]
  end

  def create
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comment = Comment.create(comment_params)
  end

  def update
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comment = Comment.find params[:id]
    @comment.update_attributes(comment_params)

    redirect_to milestone_issue_comment_path(@milestone, @issue, @comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:issue_id, :author_id, :description, :state)
  end
end
