module TasksHelper
    def tasks_for_select
        Task.pluck(:sem,:id)
    end
end
