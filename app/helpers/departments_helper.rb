module DepartmentsHelper
    def departments_for_select
        Department.pluck(:dep_name,:id)
    end
end
