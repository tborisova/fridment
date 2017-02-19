class MilestonesController < ApplicationController

  def index
    @milestones = Milestone.all
  end

  def new
    @milestone = Milestone.new
  end

  def edit
    @milestone = Milestone.find params[:id]
  end

  def create
    @milestone = Milestone.create(milestone_params)
    
    redirect_to action: :index
  end

  def get_issues
    Issue.get_issues(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:name, :description, :id)
  end
end
