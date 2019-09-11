class AppMailer < ApplicationMailer
  
  # Sends employer a notification that someone has signed up for a job!
  def jobseeker_applied(employer_name, job_name, employer_email, link)
    @employer_name = employer_name
    @job_name = job_name
    @link = link
    mail to: employer_email, subject: "New applicant for your listed job!"
  end
  
end
