class CreateJoinTableJobseekerSkill < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobseekers, :skills do |t|
    end
  end
end
