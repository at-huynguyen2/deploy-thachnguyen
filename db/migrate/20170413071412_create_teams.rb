class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string  :name
      t.string  :short_name
      t.boolean :seed
      t.string  :status
      t.integer :point
    end
  end
end
