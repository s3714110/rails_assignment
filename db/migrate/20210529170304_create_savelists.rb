class CreateSavelists < ActiveRecord::Migration[5.2]
  def change
    create_table :savelists do |t|
      t.string :list
      t.integer :user_id

      t.timestamps
    end
  end
end
