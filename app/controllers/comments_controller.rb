class CommentsController < ApplicationController

  def index
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comments = Comment.where(issue_id: params[:issue_id])
    add_breadcrumb 'Milestones', milestones_path
    add_breadcrumb @milestone.name, milestone_issues_path(@milestone)
    add_breadcrumb @issue.name, milestone_issue_path(@milestone, @issue)
    add_breadcrumb 'Comments', milestone_issue_comments_path(@milestone, @issue)
  end

  def new 
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comment = Comment.new
    add_breadcrumb 'Milestones', milestones_path
    add_breadcrumb @milestone.name, milestone_issues_path(@milestone)
    add_breadcrumb @issue.name, milestone_issue_path(@milestone, @issue)
    add_breadcrumb 'Comments', milestone_issue_comments_path(@milestone, @issue)
    add_breadcrumb 'New', new_milestone_issue_comment_path(@milestone, @issue)
  end

  def show 
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comment = Comment.find params[:id]
    add_breadcrumb 'Milestones', milestones_path
    add_breadcrumb @milestone.name, milestone_issues_path(@milestone)
    add_breadcrumb @issue.name, milestone_issue_path(@milestone, @issue)
    add_breadcrumb 'Comments', milestone_issue_comments_path(@milestone, @issue)
    add_breadcrumb "Comment by #{@comment.author.email}", milestone_issue_comment_path(@milestone, @issue, @comment)
  end

  def edit
    @milestone = Milestone.find params[:milestone_id]
    @issue = Issue.find params[:issue_id]
    @comment = Comment.find params[:id]
    add_breadcrumb 'Milestones', milestones_path
    add_breadcrumb @milestone.name, milestone_issues_path(@milestone)
    add_breadcrumb @issue.name, milestone_issue_path(@milestone, @issue)
    add_breadcrumb 'Comments', milestone_issue_comments_path(@milestone, @issue)
    add_breadcrumb "Edit comment", milestone_issue_comment_path(@milestone, @issue, @comment)
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
