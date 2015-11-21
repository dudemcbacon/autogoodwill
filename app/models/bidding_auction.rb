class BiddingAuction < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :itemid
end
