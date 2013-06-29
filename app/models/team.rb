class Team < ActiveRecord::Base

  # TODO: error handling
  # attr_reader :errors

  attr_accessible :name, :about

  belongs_to :user
  has_many :people
  has_many :team_members, through: :people

  validates :name, uniqueness: true, presence: true
end