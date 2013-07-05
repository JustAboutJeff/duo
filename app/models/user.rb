class User < ActiveRecord::Base
  require 'digest'

  attr_accessible :name, :email, :password, :password_confirmation, :admin

  has_many :team_members
  has_many :teams, through: :team_members

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, length: { minimum: 6 }, :if => :validate_password?
  validates :password_confirmation, presence: true, :if => :validate_password?

  has_secure_password
  before_save :get_gravatar_hash, :get_duo

  # scope :team_mates -> { joins(:team_members).where('user_id = ?'), self.id  }

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end

  def validate_password?
    new_record? || password.present? || password_confirmation.present?
  end

  def get_duo
    'TEST DUO' # self.duo = self.team_mates.all.sample.name
  end
end