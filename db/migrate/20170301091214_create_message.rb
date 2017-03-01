class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender_id
      t.string :receiver_id
      t.string :content
      t.string :message_id
    
      t.timestamps null: false
    end
  end
end
