module InstructorsHelper
    def instructors_for_select
        Instructor.pluck(:name,:id)
    end
end
