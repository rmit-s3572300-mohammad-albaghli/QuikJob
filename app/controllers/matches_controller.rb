class MatchesController < ApplicationController
    
    def match_js
        if current_jobseeker
            #List of matching jobs
            @list_matches = []
            #Loop through all jobs and comparing matching skills
            Job.all.each do |job|
                @skill_match = 0
                job.skills.each do |skill|
                    current_jobseeker.skills.each do |js_skill|
                        if js_skill == skill
                            @skill_match += 1
                        end
                    end
                end
                if @skill_match > 0
                    @list_matches << job
                end
            end 
        else
            flash[:danger] = "Please log in to view the matching page!"
            redirect_to root_path
        end
        
    end
    
    def match_em
        if current_employer
            #List of matching jobseeker
            @list_matches = []
            if params[:job_id]
                @job = Job.find(params[:job_id])
                #Loop through all jobseekers and compare skills
                Jobseeker.all.each do |jobseeker|
                    @skill_match = 0
                    jobseeker.skills.each do |js_skill|
                        @job.skills.each do |skill|
                            if js_skill == skill
                                @skill_match += 1
                            end
                        end
                    end
                    if @skill_match > 0
                        @list_matches << jobseeker
                    end
                end
            else
                flash[:danger] = "This page does not exist!"
                redirect_to root_path
            end 
        else
            flash[:danger] = "Please log in to view the matching page!"
            redirect_to root_path
        end
        
    end
    
end
