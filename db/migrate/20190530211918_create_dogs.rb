class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :location
      t.string :name
      t.string :breed
      t.string :status
      t.string :image_url
      t.timestamps
    end
  end
end
