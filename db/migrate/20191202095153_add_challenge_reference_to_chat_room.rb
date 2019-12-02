class AddChallengeReferenceToChatRoom < ActiveRecord::Migration[5.2]
  def change
    add_reference :chat_rooms, :challenge, foreign_key: true
  end
end
