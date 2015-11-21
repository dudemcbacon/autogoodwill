class CreateBiddingAuctions < ActiveRecord::Migration
  def change
    create_table :bidding_auctions do |t|
      t.integer :autionid
      t.integer :bids
      t.string :country
      t.float :current
      t.datetime :end
      t.string :max
      t.string :href
      t.string :item
      t.integer :itemid
      t.string :seller
      t.float :shipping
      t.string :state
      t.integer :zipcode
      t.boolean :bidding
      t.boolean :winning

      t.timestamps null: false
    end

    add_reference :bidding_auctions, :user, index: true, foreign_key: true
  end
end
