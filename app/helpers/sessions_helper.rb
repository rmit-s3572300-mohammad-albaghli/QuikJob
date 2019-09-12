module SessionsHelper
    def log_in_jobseeker(jobseeker)
        session[:jobseeker_id] = jobseeker.id
    end
    
    def log_in_employer(employer)
        session[:employer_id] = employer.id
    end
    
    def rememberJobseeker(jobseeker)
        jobseeker.remember
        cookies.permanent.signed[:jobseeker_id] = jobseeker
        cookies.permanent[:remember_token] = jobseeker.remember_token
    end
    
     def rememberEmployer(jobseeker)
        jobseeker.remember
        cookies.permanent.signed[:jobseeker_id] = jobseeker
        cookies.permanent[:remember_token] = jobseeker.remember_token
    end
    
    def current_jobseeker
        if session[:jobseeker_id]
            @current_jobseeker ||= Jobseeker.find_by(id: session[:jobseeker_id])
        elsif(jobseeker_id = cookies.signed[:jobseeker_id])
            jobseeker = Jobseeker.find_by(id: session[:jobseeker_id])
            if jobseeker && jobseeker.authenticated?(cookies[:remember_token])
                log_in jobseeker
                @current_jobseeker ||= Jobseeker.find_by(id: session[:jobseeker_id])
            end 
        end
    end
    
    def current_employer
        if session[:employer_id]
            @current_employer ||= Employer.find_by(id: session[:employer_id])
        elsif(employer_id = cookies.signed[:employer_id])
            employer = Employer.find_by(id: session[:employer_id])
            if employer && employer.authenticated?(cookies[:remember_token])
                log_in employer
                @current_employer ||= Employer.find_by(id: session[:employer_id])
            end 
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
    
    def forgetJobseeker(jobseeker)
        jobseeker.forget
        cookies.delete(:jobseeker_id)
        cookies.delete(:remember_token)
    end
    
    def forgetEmployer(employer)
        employer.forget
        cookies.delete(:employer_id)
        cookies.delete(:remember_token)
    end
        
end
