class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  # def show
  # end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private
  def course_params
    params.require(:course).permit(:course_name)
  end
end
