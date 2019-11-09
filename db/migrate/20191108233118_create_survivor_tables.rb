class CreateSurvivorTables < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues, force: :cascade  do |t|
      t.string "name", null: false
      t.integer "max_players", null: false, default: 12
      t.string "code", nulle: false
      t.integer "commissioner", null: false
      t.integer "number_of_qbs", null: false, default: 1
      t.integer "number_of_wrs", null: false, default: 1
      t.integer "number_of_rbs", null: false, default: 1
      t.integer "number_of_tes", null: false, default: 1
      t.integer "number_of_kickers", null: false, default: 1
      t.integer "number_of_defenses", null: false, default: 1
    end

    create_table :leagues_users, force: :cascade do |t|
      t.integer "league_id",  null: false
      t.integer "user_id",    null: false
      t.index ["user_id", "league_id"], unique: true
    end

    create_table :players, force: :cascade do |t|
      t.string    "name",       null: false
      t.string    "team",       null: false
      t.integer   "position",   null: false
    end

    create_table :rosters, force: :cascade do |t|
      t.integer "week_number",     null: false, index: { unique: true }
      t.integer "user_id",         null: false, index: { unique: true }
      t.integer "league_id",       null: false, index: { unique: true }
      t.integer "score",           null: false, default: 0
      t.index ["user_id", "league_id", "week_number"], unique: true
    end

    create_table :rostered_players, force: :cascade do |t|
      t.integer "player_id", null: false, index: { unique: true }
      t.integer "roster_id", null: false, index: { unique: true }
    end

    create_table :position_players_stats, force: :cascade do |t|
      t.integer "player_id", null: false, index: { unique: true }
      t.integer "pass_yards", default: 0
      t.integer "pass_tds", default: 0
      t.integer "interceptions", default: 0
      t.integer "rush_yards", default: 0
      t.integer "rush_tds", default: 0
      t.integer "receptions", default: 0
      t.integer "rec_yards", default: 0
      t.integer "rec_tds", default: 0
      t.integer "return_tds", default: 0
      t.integer "two_point", default: 0
      t.integer "fumbles_lost", default: 0

    end

    create_table :kickers_stats, force: :cascade do |t|
      t.integer "0_to_19", default: 0
      t.integer "20_to_29", default: 0
      t.integer "30_to_39", default: 0
      t.integer "40_to_49", default: 0
      t.integer "50_plus", default: 0
      t.integer "pat", default: 0
      t.integer "player_id", default: 0
    end

    create_table :defenses_stats, force: :cascade do |t|
      t.integer "sacks", default: 0
      t.integer "ints", default: 0
      t.integer "fumble_recoveries", default: 0
      t.integer "touchdowns", default: 0
      t.integer "safeties", default: 0
      t.integer "blocked_kicks", default: 0
      t.integer "return_tds", default: 0
      t.integer "points_allowed", default: 0
      t.integer "player_id", default: 0
    end
  end
end