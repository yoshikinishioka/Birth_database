class AddColumnReceiverNameSenderNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :receiver_name, :string
    add_column :messages, :sender_name, :string
  end
end
