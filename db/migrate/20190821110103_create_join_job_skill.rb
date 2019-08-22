class CreateJoinJobSkill < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobs, :skills do |t|
    end
  end
end
