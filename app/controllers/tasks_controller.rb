class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all()
  end

  def show
    # get task from param id
    @completed_string = "This task is not completed."
    if @task.completed == true
      @completed_string = "This task is completed."
    end
  end

  def new 
    @task = Task.new
  end

  def create 
    # create new task instance
    @task = Task.new(task_params)
    if @task.save
      # when it saves, go to the show page
      redirect_to task_path(@task)
    else
      # when it DOESNT save, show the form again
      render 'new'
      # show the new.html.erb view
    end
  end

  def edit
    # @task set in set_task
  end

  def update
    #check if task can be saved to the db
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit'
      # show the edit.html.erb view
    end
  end

  def destroy 
    @task.destroy
    redirect_to tasks_path
  end

   # STRONG PARAMS / whitelist what the user can give us
   def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end
