class HomeController < ApplicationController

    def index
        if signed_in?
            # If signed in, redirect to the user's tasks page with 'done' parameter set to false
            redirect_to user_task_path(done: false)
        end
        # If not signed in, fetch public tasks
        @tasks = Task.where(public: true)
    end
    
end
