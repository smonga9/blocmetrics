class CreateRegisteredapps < ActiveRecord::Migration[5.1]
  def change
    create_table :registeredapps do |t|
      t.string :name
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
