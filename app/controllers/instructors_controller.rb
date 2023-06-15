class InstructorsController < ApplicationController
  #before_action :require_login
  def index
    @instructors = Instructor.all
  end

  def show
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to instructors_path
    else
      render 'new'
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])

    if @instructor.update(instructor_params1)
      redirect_to instructors_path
    else
      render 'edit'
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    redirect_to instructors_path
  end

  private
    def instructor_params
      params.require(:instructor).permit(:name,:email,:password,:college_id)
    end

    def instructor_params1
      params.require(:instructor).permit(:name,:email,:college_id)
    end

    def require_login
      unless logged_in?
        redirect_to login_path
      end
    end
end
