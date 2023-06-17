class EvaluationsController < ApplicationController
    def index
        @tasks = Task.all
    end

    def evaluate
        @task = Task.find(params[:id])
        @evaluation_form = EvaluationForm.find_by(evaluator: session[:user_type])
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
        @evaluation_records = EvaluationRecord.where(task_id: @tasks.pluck(:id))
    rescue ActiveRecord::RecordNotFound
                # Article with the specified ID does not exist
                flash[:error] = "record not found."
                redirect_to root_path
            end
        end

        def end_evaluation
            @task = Task.find(params[:id])
            @evaluation_records = EvaluationRecord.where(task_id: @task)




           evaluation_records = []

          @evaluation_records.each do |evaluation_record|
              evaluation_records << evaluation_record.record
          end

          puts "TDEBUG:-#{evaluation_records}"
          compute_record(evaluation_records)
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

    def compute_record(data)
        # Parse the JSON data
        responses = JSON.parse(data.to_json)

        # Initialize counters for each statement
        statement_counts = Hash.new(0)

        # Count the number of ratings for each statement
        responses.each do |response|
            response.each do |statement, rating|
                statement_counts[statement] += 1 if rating.to_i >= 4
            end
        end

        # Calculate the percentage agreement for each statement
        percentage_agreements = {}
        statement_counts.each do |statement, count|
            percentage_agreements[statement] = (count.to_f / responses.size) * 100
        end

        # Calculate the overall percentage agreement
        overall_percentage_agreement = (percentage_agreements.values.sum / percentage_agreements.size)


        # # Output the results
        # percentage_agreements.each do |statement, percentage|
        #   puts "#{statement}: #{percentage}%"
        # end

        # puts "Overall Percentage Agreement: #{overall_percentage_agreement}%"

        return {percentage_agreement: percentage_agreements, overall_percentage_agreement: overall_percentage_agreement}
    end
    

end
