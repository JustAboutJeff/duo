class User < ActiveRecord::Base
  require 'digest'

  attr_accessible :name, :email, :password, :password_confirmation, :partner_id

  has_many :team_members
  has_many :teams, through: :team_members

  has_many :pairs

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, length: { minimum: 6 }, :if => :validate_password?
  validates :password_confirmation, presence: true, :if => :validate_password?

  has_secure_password
  before_save :get_gravatar_hash

  # grabs the most recent pair object (pair relationship)
  def current_pair
    @current_pair ||= pairs.order("date DESC").limit(1).pop
  end

  # grabs the most recent user object (pair relationship)
  def current_partner
    current_pair.pair
  end

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end

  def validate_password?
    new_record? || password.present? || password_confirmation.present?
  end
end