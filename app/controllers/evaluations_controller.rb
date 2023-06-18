class EvaluationsController < ApplicationController
    include EvaluationsHelper

    def index
        @tasks = Task.all
    end

    def evaluate
        @task = Task.find(params[:id])
        
        if current_user.is_a?(Instructor) && current_user.ho_d_department.present?
            @evaluation_form = EvaluationForm.find_by(evaluator: "hod")
        else
            @evaluation_form = EvaluationForm.find_by(evaluator: session[:user_type])
        end
        
        @evaluation_record = EvaluationRecord.new
    end

    def create
        @evaluation_record = EvaluationRecord.new(evaluation_record_params)
        # # Retrieve the current detailed_record or initialize it as an empty array if it's nil
        # detailed_record = @evaluation_record.detailed_record || []

        # # Append the new hash to the existing detailed_record array
        # detailed_record << params[:evaluation_record][:detailed_record]

        # @evaluation_record.assign_attributes(evaluation_record_params)
        # @evaluation_record.detailed_record = detailed_record
        if @evaluation_record.save
          redirect_to evaluation_path
      else
          render 'index'
      end
  end

  def show
    begin
        @tasks = Task.where(instructor_id: params[:id])
        @evaluation_results = EvaluationResult.where(task_id: @tasks.pluck(:id))
        @evaluation_criteriums = EvaluationCriterium.all
    rescue ActiveRecord::RecordNotFound
                # Article with the specified ID does not exist
            flash[:error] = "record not found."
            redirect_to root_path
        end
    end

    def end_evaluation
            @task = Task.find(params[:id])
            @evaluation_records = EvaluationRecord.where(task_id: @task)

            mean = combined_mean(@evaluation_records)

            percentage = compute_percentage(mean[:student][:average_value],mean[:instructor][:average_value],mean[:hod][:average_value])

          puts "TDEBUG:-#{mean[:student][:average_value]}"

          @evaluation_result = EvaluationResult.new

          @evaluation_result.combined_mean = mean
          @evaluation_result.total_percentage = percentage
          @evaluation_result.task_id = params[:id]

          if @evaluation_result.save
            @task.start_eval = false
            @task.active = false
            @task.save
          end
          
        # EvaluationResult.create();

        # if @task.start_eval
        #     @task.update(task_params)
        # end
        redirect_to evaluation_path
    end

    
    private
    def evaluation_record_params
        params.require(:evaluation_record).permit(:task_id,:evaluators,:record)
    end

    def task_params
        params.require(:task).permit(:start_eval)
    end
    

end

