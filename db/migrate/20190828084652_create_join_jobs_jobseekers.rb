class CreateJoinJobsJobseekers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobs, :jobseekers do |t|
    end
  end
end
