class Auction < ActiveRecord::Base
  before_save :default_values
  belongs_to :user
  validates_uniqueness_of :itemid

  def default_values
    self.seen ||= false
    self.ignore ||= false
    true
  end
end
