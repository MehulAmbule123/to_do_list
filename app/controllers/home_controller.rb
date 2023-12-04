class HomeController < ApplicationController

    def index
        if signed_in?
            redirect_to user_task_path(done: false)
        end
        @tasks = Task.where(public: true)
    end
    
end
