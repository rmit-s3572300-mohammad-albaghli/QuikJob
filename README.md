# kake-capstone
QuikJob
-------
Github Url: https://github.com/rmit-s3572300-mohammad-albaghli/QuikJob
Heroku Url (Deployment): https://quikjob.herokuapp.com

Release Information (Major Changes)
-----------------------------------
Version 1.0.4
-Background images resized to load better
-Mobile version of site is up and running

Version 1.0.3 
- Skill system has been reworked and improved.
- Visual update has been implemented on all available pages.
- Allow jobseeker to upload their resume to the website (by PDF).

Version 1.0.2 
- Updated visual on multiple pages (homepage, jobseeker page, employer page, default page)
- Admin functionality has been added.
- Jobseekers and employers can now add custom skills to the database. 
- Search functionality have been redefined for easier use.

Version 1.0.1 
- Allow jobseekers to apply to job. 
- Send notification emails to jobseekers when they have been offered job.
- Send notification emails to employers when their jobs have been applied to.
- Allow employers to put jobs on hold so jobseekers can't apply no more.
- Added more skills to the database for jobseekers and employers to utilised.
- Early search functionality has been added.

Version 1.0.0 
- Allow users to sign up and login as jobseekers and employers.
- Allow jobseeker to add "skills" to their profile to match for a job.
- Allow employers to create and post their jobs.
- Allow employers to add skills to their created jobs.
- A matching algorithm has been added to match jobseekers with suitable jobs.

Installation & Running Instruction: 
-------------------
1. Make sure your Ruby and Ruby on Rails are installed on your local machine.
2. Clone or download the source code from the Github repository.
3. Run "bundle update" and "bundle install" upon cloning.
3.1 If there is a bug regarding "Bundler 2", please remove the Gemfile.lock from your directory.
4. Run rails db:migrate to make sure the database is set up properly.
5. Run rails s to start the server.
