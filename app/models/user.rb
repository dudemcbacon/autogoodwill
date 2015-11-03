class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ignored_items, dependent: :destroy

  has_settings do |s|
    s.key :dashboard, :defaults => {
      :gw_user => 'blue',
      :gw_pass => 'monthly',
      :gw_searches => [ 'commodore', 'dreamcast' ]
    }
  end
end
