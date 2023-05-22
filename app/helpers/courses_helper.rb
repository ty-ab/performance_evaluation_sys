module CoursesHelper
    def courses_for_select
        Course.pluck(:course_name,:id)
    end
end
