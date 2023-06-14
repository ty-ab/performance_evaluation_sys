class AdminController < ApplicationController
  def index
  view = params[:view]

  # Determine which view to render based on the 'view' parameter
  case view

    when 'manage_users'
      @users = User.all
      @partial = 'users/user'
    when 'manage_instructors'
      @instructors = Instructor.all
      @partial = 'instructors/instructor'
    when 'manage_students'
      @students = Student.all
      @partial = 'students/student'
    when 'manage_colleges'
      @colleges = College.all
      @partial = 'colleges/college'
    when 'manage_departments'
      @departments = Department.all
      @partial = 'departments/department'
    when 'manage_criterias'
      @evaluation_criteriums = EvaluationCriterium.all
      @partial = 'evaluation_criteriums/evaluation_criteria'
    when 'manage_froms'
      @evaluation_forms = EvaluationForm.all
      @partial = 'evaluation_forms/evaluation_form'
    else
      # Handle invalid view parameter or default view
      @partial = 'default_view'
  end

  respond_to do |format|
    format.html { render }  # Render HTML response
    format.js   # Render JavaScript response
  end
end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
