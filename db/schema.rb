# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_08_233118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.datetime "published_at"
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defenses_stats", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "week_id", null: false
    t.integer "sacks", default: 0
    t.integer "ints", default: 0
    t.integer "fumble_recoveries", default: 0
    t.integer "touchdowns", default: 0
    t.integer "safeties", default: 0
    t.integer "blocked_kicks", default: 0
    t.integer "return_tds", default: 0
    t.integer "points_allowed", default: 0
    t.index ["player_id", "week_id"], name: "index_defenses_stats_on_player_id_and_week_id", unique: true
    t.index ["player_id"], name: "index_defenses_stats_on_player_id"
    t.index ["week_id"], name: "index_defenses_stats_on_week_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "kickers_stats", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "week_id", null: false
    t.integer "0_to_19", default: 0
    t.integer "20_to_29", default: 0
    t.integer "30_to_39", default: 0
    t.integer "40_to_49", default: 0
    t.integer "50_plus", default: 0
    t.integer "pat", default: 0
    t.index ["player_id", "week_id"], name: "index_kickers_stats_on_player_id_and_week_id", unique: true
    t.index ["player_id"], name: "index_kickers_stats_on_player_id"
    t.index ["week_id"], name: "index_kickers_stats_on_week_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", null: false
    t.integer "max_players", default: 12, null: false
    t.string "group_password"
    t.integer "commissioner_id", null: false
    t.json "positions"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "recipient_id"
    t.bigint "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.bigint "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.string "team", null: false
    t.integer "position", null: false
  end

  create_table "position_players_stats", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "week_id", null: false
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
    t.index ["player_id", "week_id"], name: "index_position_players_stats_on_player_id_and_week_id", unique: true
  end

  create_table "rosters", force: :cascade do |t|
    t.integer "week_id", null: false
    t.integer "team_id", null: false
    t.integer "score", default: 0, null: false
    t.json "positions", null: false
    t.index ["team_id", "week_id"], name: "index_rosters_on_team_id_and_week_id", unique: true
    t.index ["team_id"], name: "index_rosters_on_team_id"
    t.index ["week_id"], name: "index_rosters_on_week_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "league_id", null: false
    t.integer "user_id", null: false
    t.string "name", null: false
    t.integer "season_score", default: 0, null: false
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["user_id", "league_id"], name: "index_teams_on_user_id_and_league_id", unique: true
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "announcements_last_read_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "number", null: false
    t.boolean "current", default: false, null: false
    t.index ["number"], name: "index_weeks_on_number", where: "(current = true)"
  end

  add_foreign_key "services", "users"
end
