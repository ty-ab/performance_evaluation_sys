module EvaluationsHelper
	def compute_mean(data)
		formatted_data = data.gsub('}{', "},\n{")
		formatted_data = "[\n#{formatted_data}\n]"

        # Parse the JSON data
        responses = JSON.parse(formatted_data)

        combined_data = {}
        responses.each do |item|
        	item.each do |key, value|
        		field = key.to_s.gsub("evaluation_form[form_fields][", "").gsub("]", "").to_i
        		combined_data[field] ||= []
        		combined_data[field] << value.to_i
        	end
        end

        averages = combined_data.transform_values { |values| values.sum / values.size.to_f }

        total_fields = averages.size
        agreement_count = averages.count { |_field, avg| avg == 4 }
        percentage_agreement = (agreement_count.to_f / total_fields) * 100

        # puts percentage_agreement

        # puts ""

        combined_data = {}
        total_fields = 0

        responses.each do |item|
        	item.each do |key, value|
        		field = key.to_s.scan(/\d+/).first.to_i
        		combined_data[field] ||= []
        		combined_data[field] << value.to_i
        		total_fields = [total_fields, field].max
        	end
        end

        averages = combined_data.transform_values { |values| values.sum / values.size.to_f }

        agreement_count = averages.count { |_field, avg| avg == 3 }
        percentage_agreement = (agreement_count.to_f / total_fields) * 100

        average_value = averages.values.sum / averages.size.to_f

        # puts averages
        # puts ""
        # puts percentage_agreement
        # puts ""
        # puts average_value


        # # Initialize counters for each statement
        # statement_counts = Hash.new(0)

        # # Count the number of ratings for each statement
        # responses.each do |response|
        #     response.each do |statement, rating|
        #         statement_counts[statement] += 1 if rating.to_i >= 4
        #     end
        # end

        # # Calculate the percentage agreement for each statement
        # percentage_agreements = {}
        # statement_counts.each do |statement, count|
        #     percentage_agreements[statement] = (count.to_f / responses.size) * 100
        # end

        # Calculate the overall percentage agreement
        # overall_percentage_agreement = (percentage_agreements.values.sum / percentage_agreements.size)


        # # Output the results
        # percentage_agreements.each do |statement, percentage|
        #   puts "#{statement}: #{percentage}%"
        # end

        # puts "Overall Percentage Agreement: #{overall_percentage_agreement}%"
        return {averages: averages, average_value: average_value}
    end

    def compute_percentage(student_mean,instructor_mean,hod_mean)
        student_weight = 0.7
        instructor_weight = 0.2
        hod_weight = 0.1

        # # Calculate the mean score for students
        # student_mean = compute_mean(student)

        # # Calculate the mean score for instructors
        # instructor_mean = compute_mean(instructor)

        # # Calculate the mean score for HOD
        # hod_mean = compute_mean(hod)

        # Apply weightage to each group's mean score
        weighted_student_mean = student_mean * student_weight
        weighted_instructor_mean = instructor_mean * instructor_weight
        weighted_hod_mean = hod_mean * hod_weight

        # Calculate the overall total mean score
        total_mean_score = weighted_student_mean + weighted_instructor_mean + weighted_hod_mean
    end


    def combined_mean(evaluation_records)
        instructor_records = ""
        student_records = ""
            hod_records = ""

        evaluation_records.each do |evaluation_record|
            if evaluation_record.evaluators == "instructor"
                instructor_records += evaluation_record.record
            elsif evaluation_record.evaluators == "student"
                student_records += evaluation_record.record
            else
                hod_records += evaluation_record.record
            end
        end

        return {student: compute_mean(student_records),instructor: compute_mean(instructor_records),hod: compute_mean(hod_records)}
    end
end
