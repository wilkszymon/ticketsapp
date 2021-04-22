class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :description
      t.boolean :important
      t.string :city

      t.timestamps
    end
  end
end
