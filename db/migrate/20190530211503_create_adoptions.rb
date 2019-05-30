class CreateAdoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptions do |t|

      t.timestamps
    end
  end
end
