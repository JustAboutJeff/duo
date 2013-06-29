class TeamMember < ActiveRecord::Base

  # TODO: error handling
  # attr_reader :errors

  belongs_to :people
  belongs_to :teams
end