class HeadOfDepartmentsController < ApplicationController
  def index
    @ho_d_departments = HoDDepartment.all
  end

  def show
  end

  def new
    @ho_d_department = HoDDepartment.new
    @instructors = Instructor.all
    @departments = Department.all
  end

  def create
    @ho_d_department = HoDDepartment.new(ho_d_department_params)
    if @ho_d_department.save
      redirect_to head_of_departments_path
    else
      render 'new'
    end
  end

  def edit
    @ho_d_department = HoDDepartment.find(params[:id])
    @instructors = Instructor.all
    @departments = Department.all
  end

  def update
    @ho_d_department = HoDDepartment.find(params[:id])

    if @ho_d_department.update(ho_d_department_params)
      redirect_to head_of_departments_path
    else
      render 'new'
    end
  end

  def destroy
    @ho_d_department = HoDDepartment.find(params[:id])
    @ho_d_department.destroy
    redirect_to head_of_departments_path
  end

  private
    def ho_d_department_params
      params.require(:ho_d_department).permit(:department_id,:instructor_id)
    end
end
