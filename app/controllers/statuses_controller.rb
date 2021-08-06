class StatusesController < ApplicationController
  def index
  end

  def dashboard
  end

  def new
    @status = Status.new
    @tasks = @status.tasks.build
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to status_path(@status)
    else
      render 'new'
    end
  end

  private

  def status_params
    params.require(:status).permit(:date, tasks_attributes: [:id, :task_name, :git_pr_link, :hour, :_destroy ])
  end
end
