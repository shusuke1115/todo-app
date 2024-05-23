class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.date :birthday
      t.integer :age
      t.integer :gender

      t.timestamps
    end
  end
end
