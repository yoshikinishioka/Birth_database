class CreateUserFriend < ActiveRecord::Migration
  def change
    create_table :users_friends do |t|
      t.references :user, index: true, null: false
      t.references :friend, index: true, null: false
  
      t.timestamps null: false
    end
  end
end
