class Team < ActiveRecord::Base

  attr_accessible :name

  has_many :team_members
  has_many :users, through: :team_members

  validates :name, uniqueness: true, presence: true
end