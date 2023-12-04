class HomeController < ApplicationController

    def index
        if signed_in?
            redirect_to user_task_path
        end
    end
    
end
