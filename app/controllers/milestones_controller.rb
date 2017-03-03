class MilestonesController < ApplicationController

  def index
    @milestones = Milestone.all
  end

  def new
    @milestone = Milestone.new
  end

  def show
    @milestone = Milestone.find params[:id]
  end

  def edit
    @milestone = Milestone.find params[:id]
  end

  def create
    @milestone = Milestone.create(milestone_params)
    
    redirect_to action: :index
  end

  def finish
    @milestone = Milestone.find params[:milestone_id]

    @milestone.update_attribute(:state, 2)
  end

  private

  def milestone_params
    params.require(:milestone).permit(:name, :description, :id, :author_id, :state)
  end
end
