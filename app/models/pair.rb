class Pair < ActiveRecord::Base
  attr_accessible :date, :user_id, :pair_id
  belongs_to :user
  belongs_to :pair, class_name: "User"

  after_save :create_inverse

  private

  def create_inverse
    Pair.create(date: self.date, user_id: self.pair_id, pair_id: self.user_id)
  end
end