class IssuesController < ApplicationController

  def index
    @issues = Issue.where(params[:milestone_id])
    @milestone = Milestone.find params[:milestone_id]
  end

  def edit
    @milestone = Milestone.find params[:milestone_id]
    @issue = @milestone.issues.find params[:id]
  end

  def new
    @issue = Issue.new
    @milestone = Milestone.find params[:milestone_id]
  end

  def update
    @milestone = Milestone.find params[:milestone_id]
    @issue = @milestone.issues.find params[:id]

    @issue.update_attributes(issue_params)

    redirect_to action: :index
  end

  def show
    @issue = Issue.find params[:id]
    @milestone = @issue.milestone
  end

  def issue_params
    params.require(:issue).permit(:assignee_name)
  end
end
