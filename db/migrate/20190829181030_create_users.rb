class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.index :email, unique: true
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
