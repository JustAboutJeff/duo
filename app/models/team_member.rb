class TeamMember < ActiveRecord::Base
  belongs_to :users
  belongs_to :teams
end