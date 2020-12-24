class AddScLeagueRefToScores < ActiveRecord::Migration[6.1]
  def change
    add_reference :scores, :sc_league, null: false, foreign_key: true
  end
end
