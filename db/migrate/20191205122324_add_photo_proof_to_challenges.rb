class AddPhotoProofToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :photo_proof, :boolean
  end
end
