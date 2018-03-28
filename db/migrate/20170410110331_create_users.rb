class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :range
      t.string :email
      t.string :phone
      t.boolean :status
      t.string :password_digest
      t.timestamps
    end
  end
end
