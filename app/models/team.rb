class Team < ActiveRecord::Base

  attr_accessible :name

  has_many :users
  has_many :team_members, through: :users

  validates :name, uniqueness: true, presence: true
end