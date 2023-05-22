class SemesterController < ApplicationController
  def index
    @semesters = Semester.all
  end

  def new
    @semester = Semester.new
  end

  def show
  end

  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      redirect_to semester_index_path
    else
      render 'new'
    end
  end

  def edit
    @semester = Semester.find(params[:id])
  end

  def update
    @semester = Semester.find(params[:id])
    if @semester.update(semester_params)
      redirect_to semester_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @semester = Semester.find(params[:id])
    @semester.destroy
    redirect_to semester_index_path
  end

  private
    def semester_params
      params.require(:semester).permit(:start,:end,:sem,:status)
    end
end
