module CollegesHelper
    def colleges_for_select
        College.pluck(:college_name,:id)
    end
end
