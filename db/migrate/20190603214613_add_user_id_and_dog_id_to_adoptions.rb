class AddUserIdAndDogIdToAdoptions < ActiveRecord::Migration[5.2]
  def change
    add_column :adoptions, :user_id, :integer
    add_column :adoptions, :dog_id, :integer
  end
end
