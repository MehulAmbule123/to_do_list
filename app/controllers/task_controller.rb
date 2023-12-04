class TaskController < ApplicationController
    def index
        @tasks = Task.where(user: current_user)
    end
end
