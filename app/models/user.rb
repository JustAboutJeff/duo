class User < ActiveRecord::Base
  require 'digest'

  # TODO: error handling
  # attr_reader :errors

  attr_accessible :name, :email, :password, :password_confirmation

  has_many :teams
  has_many :people

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, length: { minimum: 6 }, :if => :validate_password?
  validates :password_confirmation, presence: true, :if => :validate_password?

  has_secure_password
  before_save :get_gravatar_hash

  def self.validate(params={})
    return nil unless @user = User.find_by_email(params[:email])
    @user.authenticate(params[:password]) ? @user : nil
  end

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end

  def validate_password?
    new_record? || password.present? || password_confirmation.present?
  end
end