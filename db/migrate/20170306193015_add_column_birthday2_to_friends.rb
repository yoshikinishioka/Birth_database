class AddColumnBirthday2ToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :birthday2, :string
  end
end
