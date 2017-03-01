class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :fb_user_id
      t.date :birthday
      t.string :name
      t.string :icon

      t.timestamps null: false
    end
  end
end
