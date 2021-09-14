class StatusesController < ApplicationController
  def index
    @statuses = Status.paginate(page: params[:page], per_page: 2)
  end

  def show
    @status = Status.find(params[:id])
    @tasks = @status.tasks
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
      SendNotificationsJob.set(wait: 30.minutes).perform_later(@status)
      flash[:success] = 'Email has been sent successfully..'
      redirect_to @status
    else
      render 'new'
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if params[:Preview]
      puts 'hello....'
    end
    if @status.update(status_params)
      flash[:success] = 'status has been updated successfully..'
      redirect_to status_path
    else
      render 'edit'
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to statuses_path
  end

  private

  def status_params
    params.require(:status).permit(:date, :status_picture, tasks_attributes: [:id, :task_name, :git_pr_link, :hour, :_destroy ])
  end
end
