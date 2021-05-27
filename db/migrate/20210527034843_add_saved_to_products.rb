class AddSavedToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :saved, :boolean, default: false
  end
end
