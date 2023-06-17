class SessionsController < ApplicationController
    def new
    end
  
    def create
        #debugger
        email = params[:email]
        password = params[:password]

        user = User.find_by(email: email)
        if user&.authenticate(password)
            session[:user_id] = user.id
            session[:user_type] = 'user'
            redirect_to root_path
            return
        end

        # Authenticate Instructor
        instructor = Instructor.find_by(email: email)
        if instructor&.authenticate(password)
            session[:user_id] = instructor.id
            session[:user_type] = 'instructor'
            redirect_to root_path, notice: 'Logged in successfully!'
            return
        end

        # Authenticate Student
        student = Student.find_by(email: email)
        if student&.authenticate(password)
            session[:user_id] = student.id
            session[:user_type] = 'student'
            redirect_to root_path, notice: 'Logged in successfully!'
            return
        end

        # Authentication failed
        flash.now[:alert] = 'Invalid email or password'
        render :new
    end
  
    def destroy
        session[:user_id] = nil
        session[:user_type] = nil
        redirect_to login_path, notice: 'Logged out successfully!'
    end
end
