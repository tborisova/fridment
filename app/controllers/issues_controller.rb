class IssuesController < ApplicationController

  def index
    @milestone = Milestone.find params[:milestone_id]
    @issues = @milestone.issues
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

  def create
    @milestone = Milestone.find(params[:milestone_id])
    IssuesGeneratorJob.perform_later(params[:date_from], params[:date_to], @milestone.id)
    
    flash[:notice] = "Issues will be exported shortly!"
    redirect_to milestone_issues_path(@milestone)
  end
end
