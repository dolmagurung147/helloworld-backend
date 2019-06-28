class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :password_digest
      t.datetime :dob
      t.integer :sexualRepresentation

      t.timestamps
    end
  end
end
