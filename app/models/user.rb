class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :auctions, dependent: :destroy
  has_many :bidding_auctions, dependent: :destroy

  has_settings do |s|
    s.key :dashboard, defaults: {
      gw_user: '',
      gw_pass: '',
      gw_searches: []
    }
  end
end
