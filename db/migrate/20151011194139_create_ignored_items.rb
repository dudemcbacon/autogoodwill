class CreateIgnoredItems < ActiveRecord::Migration
  def change
    create_table :ignored_items do |t|
      t.string :itemid
      t.string :search_term

      t.timestamps null: false
    end
  end
end
