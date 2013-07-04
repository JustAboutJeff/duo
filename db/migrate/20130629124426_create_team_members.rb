class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer  :user_id, null: false
      t.integer  :team_id, null: false

      t.timestamps
    end
  end
end
