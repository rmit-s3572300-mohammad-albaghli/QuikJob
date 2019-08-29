module JobsHelper
  
  def matched_job(job, jobseeker)
    job.skills.each do |skill|
        jobseeker.skills.each do |js_skill|
            if js_skill == skill
                return true
            end
        end
    end
    return false
  end
  
  def is_applied(job, jobseeker_id)
    job.jobseekers.exists?(jobseeker_id)
  end
end
