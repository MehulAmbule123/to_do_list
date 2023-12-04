class TaskController < ApplicationController
  before_action :authenticate_user!

    def index
        @tasks = Task.where(user: current_user,done: params[:done])
    end

    # GET /tasks/new
    # Displays a form for creating a new task
    def create
      @task = current_user.tasks.new(task_params)
      if @task.save
        redirect_to user_task_path(done: false), notice: 'Task was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /tasks/:id
    # Updates the status of a task for done
    def update
      @task = Task.find(params[:id])
  
      if @task.update(done: true)
        respond_to do |format|
          format.html { redirect_to user_task_path(done: true), notice: 'Task was successfully updated.' }
          format.js   # This responds to AJAX requests (if you're using remote: true in the form)
        end
      else
        respond_to do |format|
          format.html { render :index } # Render the index view in case of errors
          format.js   # This responds to AJAX requests (if you're using remote: true in the form)
        end
      end
    end  

    # GET /tasks/new
    # Displays a form for creating a new task
    def new
      @task = Task.new
    end

    private
  
    def task_params
      params.require(:task).permit(:title, :description, :done, :public)
    end
end
