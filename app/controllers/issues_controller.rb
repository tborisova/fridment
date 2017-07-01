class IssuesController < ApplicationController

  def index
    @milestone = Milestone.find params[:milestone_id]
    @issues = @milestone.issues
    add_breadcrumb 'Milestones', milestones_path
    add_breadcrumb @milestone.name, milestone_issues_path(@milestone)
    render json: @issues
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
    add_breadcrumb 'Milestones', milestones_path
    add_breadcrumb 'Issues', milestone_issues_path(@milestone)
    add_breadcrumb @issue.name, milestone_issue_path(@milestone, @issue)
  end
  
  def new
    @issue = Issue.new
    @milestone = Milestone.find params[:milestone_id]
  end
  
  def create
    p 'DHDHDHDHDHHD'
    @milestone = Milestone.find(params[:milestone_id])
    IssuesGeneratorJob.perform_later(params[:date_from], params[:date_to], @milestone.id)
    
    flash[:notice] = "Issues will be exported shortly!"
    redirect_to milestone_issues_path(@milestone)
  end

  def add_testers
    @issue = Issue.find params[:issue_id]
    @milestone = @issue.milestone
    add_breadcrumb 'Milestones', milestones_path
    add_breadcrumb 'Issues', milestone_issues_path(@milestone)
    add_breadcrumb "Testers for #{@issue.name}", milestone_issue_path(@milestone, @issue)
  end

  def create_testers
    IssueTester.create_testers(params[:testers], params[:issue_id])
    @issue = Issue.find(params[:issue_id])
    redirect_to milestone_issues_path(@issue.milestone)
  end
end
