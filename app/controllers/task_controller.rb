class TaskController < ApplicationController
    def index
        @tasks = Task.where(user: current_user,done: params[:done])
    end

    def create
        @task = current_user.tasks.new(task_params)
        
        if @task.save
          redirect_to user_task_path(done: false), notice: 'Task was successfully created.'
        else
          render :new
        end
      end

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

      def new
        @task = Task.new
      end

      private
    
      def task_params
        params.require(:task).permit(:title, :description, :done, :public)
      end
end
