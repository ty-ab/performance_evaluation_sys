class EvaluationsController < ApplicationController
    def index
        @tasks = Task.all
    end

    def evaluate
        @task = Task.find(params[:id])
        @evaluation_form = EvaluationForm.find_by(evaluator: session[:user_type])
        @evaluation_result = EvaluationResult.new
    end

    

end
