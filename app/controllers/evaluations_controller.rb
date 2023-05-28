class EvaluationsController < ApplicationController
    def index
        @tasks = Task.all
    end

    def evaluate
        @task = Task.find(params[:id])
        @evaluation_form = EvaluationForm.find(3)
        @evaluation_result = EvaluationResult.new
        
    end

    

end
