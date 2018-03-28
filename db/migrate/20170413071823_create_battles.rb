class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.integer :id_team_a
      t.integer :id_team_b
      t.integer :score_team_a
      t.integer :score_team_b
      t.integer :id_group
      t.datetime :battle_date
    end
  end
end

