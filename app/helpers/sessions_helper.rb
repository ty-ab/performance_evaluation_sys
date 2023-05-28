module SessionsHelper
    def current_user
        case session[:user_type]
        when "user"
          @current_user ||= User.find_by(id: session[:user_id])
        when "instructor"
          @current_user ||= Instructor.find_by(id: session[:user_id])
        when "student"
          @current_user ||= Student.find_by(id: session[:user_id])
        else
          nil
        end
    end

    

    def logged_in?
        !current_user.nil?
    end

    def user_type
        session[:user_type]
    end

end
