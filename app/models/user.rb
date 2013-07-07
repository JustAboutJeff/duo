class User < ActiveRecord::Base
  require 'digest'

  attr_accessible :name, :email, :password, :password_confirmation, :partner_id

  has_many :team_members
  has_many :teams, through: :team_members
  belongs_to :partner, class_name: 'User'

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, length: { minimum: 6 }, :if => :validate_password?
  validates :password_confirmation, presence: true, :if => :validate_password?

  has_secure_password
  before_save :get_gravatar_hash

  # This method is a patch for building a self-referential
  # and cyclical relationship on the user model.
  def set_partner(pair)
    self.partner = pair
    pair.partner = self
  end

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end

  def validate_password?
    new_record? || password.present? || password_confirmation.present?
  end
end