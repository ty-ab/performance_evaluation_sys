class EvaluationResultsController < ApplicationController
  def index
  end

  def new
    @task = Task.find(params[:id])
    @evaluation_form = EvaluationForm.find_by(evaluator: session[:user_type])
    @evaluation_result = EvaluationResult.new
  end

  def show
  end

  def create
    #debugger
    #permitted_params = params.require(:evaluation_result).permit(:instructor_id, detailed_result: params.keys.select { |key| key.start_with?('q') })

    #@evaluation_result = EvaluationResult.new(permitted_params[:evaluation_result])
    @evaluation_result = EvaluationResult.new(evaluation_result_params)
    if @evaluation_result.save
      redirect_to evaluation_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  

  private
    def evaluation_result_params
       params.require(:evaluation_result).permit(:instructor_id)
    end
    
    #
end
