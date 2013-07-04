class User < ActiveRecord::Base
  require 'digest'

  attr_accessible :name, :email, :password, :password_confirmation

  has_many :teams
  has_many :team_members, through: :teams
  # is admin boolean column

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, length: { minimum: 6 }, :if => :validate_password?
  validates :password_confirmation, presence: true, :if => :validate_password?

  has_secure_password
  before_save :get_gravatar_hash

  # scope :team_mates -> { joins(:team_members).where('user_id = ?'), self.id  }
  # scope :team_mates, -> { joins(:teams).where('team_id: ?'), self.teams.id }

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end

  def validate_password?
    new_record? || password.present? || password_confirmation.present?
  end
end