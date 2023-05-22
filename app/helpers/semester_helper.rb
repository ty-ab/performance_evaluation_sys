module SemesterHelper
    def semesters_for_select
        Semester.pluck(:sem,:id)
    end
end
