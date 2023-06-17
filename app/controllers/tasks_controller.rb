class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @students = Student.where(department_id: current_user.ho_d_department.department_id)
  end

  def show
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
    @students = Student.where(department_id: current_user.ho_d_department.department_id)
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:course_id,:department_id,:instructor_id,:semester_id,:active,:start_eval, student_ids: [])
    end
end
