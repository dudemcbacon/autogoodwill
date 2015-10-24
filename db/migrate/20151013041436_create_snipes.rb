class CreateSnipes < ActiveRecord::Migration
  def change
    create_table :snipes do |t|
      t.integer :itemid
      t.float :snipe_bid
      t.datetime :auction_endtime

      t.timestamps null: false
    end
  end
end
