class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :autionid
      t.integer :bids
      t.string :country
      t.float :current
      t.datetime :end
      t.string :href
      t.string :item
      t.integer :itemid
      t.string :seller
      t.float :shipping
      t.string :state
      t.integer :zipcode
      t.boolean :seen
      t.boolean :bidding
      t.boolean :ignore
      t.string :searchterm

      t.timestamps null: false
    end

    add_reference :auctions, :user, index: true, foreign_key: true
  end
end
