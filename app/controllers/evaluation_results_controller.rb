class EvaluationResultsController < ApplicationController
  def index
    @evaluation_results = EvaluationResult.all
  end

  def new
    @task = Task.find(params[:id])
    @evaluation_form = EvaluationForm.find_by(evaluator: session[:user_type])
    @evaluation_result = EvaluationResult.new
  end

  def show
    @evaluation_form = EvaluationForm.find(params[:id])
  end

end
