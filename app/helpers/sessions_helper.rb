module SessionsHelper
    def log_in_jobseeker(jobseeker)
        session[:jobseeker_id] = jobseeker.id
    end
    
    def log_in_employer(employer)
        session[:employer_id] = employer.id
    end
    
    def current_jobseeker
        if session[:jobseeker_id]
            @current_jobseeker ||= Jobseeker.find_by(id: session[:jobseeker_id])
        end
    end
    
    def current_employer
        if session[:employer_id]
            @current_employer ||= Employer.find_by(id: session[:employer_id])
        end
    end
    
    def logged_in_employer?
        !current_employer.nil? 
    end
    
    def logged_in_jobseeker?
        !current_jobseeker.nil? 
    end
    
    def log_out
        session.delete(:employer_id)
        @current_employer = nil
        
        session.delete(:jobseeker_id)
        @current_jobseeker = nil
    end
        
end
