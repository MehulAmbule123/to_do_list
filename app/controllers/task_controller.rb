class TaskController < ApplicationController
    def index
        @tasks = Task.where(user: current_user)
    end

    def create
        @task = current_user.tasks.new(task_params)
        
        if @task.save
          redirect_to user_task_path, notice: 'Task was successfully created.'
        else
          render :new
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
