class Snipe < ActiveRecord::Base
  validates_uniqueness_of :itemid
end
