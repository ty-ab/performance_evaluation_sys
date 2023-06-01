class EvaluationsController < ApplicationController
    def index
        @tasks = Task.all
    end

    def evaluate
        @task = Task.find(params[:id])
        @evaluation_form = EvaluationForm.find_by(evaluator: session[:user_type])
        @evaluation_result = EvaluationResult.new
    end

    def create
        @evaluation_result = EvaluationResult.find_or_initialize_by(evaluators: params[:evaluation_result][:evaluators], semester_id: params[:evaluation_result][:semester_id])
        # Retrieve the current detailed_result or initialize it as an empty array if it's nil
        detailed_result = @evaluation_result.detailed_result || []

        # Append the new hash to the existing detailed_result array
        detailed_result << params[:evaluation_result][:detailed_result]

        @evaluation_result.assign_attributes(evaluation_result_params)
        @evaluation_result.detailed_result = detailed_result
        if @evaluation_result.save
          redirect_to evaluation_path
        else
          render 'index'
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
            params.require(:evaluation_result).permit(:instructor_id,:evaluators,:semester_id, :detailed_result)
        end
    
    #

end
