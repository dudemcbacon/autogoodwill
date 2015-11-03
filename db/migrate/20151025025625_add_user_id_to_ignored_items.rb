class AddUserIdToIgnoredItems < ActiveRecord::Migration
  def change
    add_reference :ignored_items, :user, index: true, foreign_key: true
  end
end
