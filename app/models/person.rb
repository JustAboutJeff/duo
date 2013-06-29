class Person < ActiveRecord::Base
  require 'digest'

  # TODO: error handling
  # attr_reader :errors

  attr_accessible :name, :email

  has_many :teams
  has_many :team_members, through: :teams

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save :get_gravatar_hash

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end
end