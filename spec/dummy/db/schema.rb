# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_30_175843) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "kudos_achievement_groups", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.bigint "parent_id"
    t.integer "position", default: 0, null: false
    t.jsonb "name", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_kudos_achievement_groups_on_parent_id"
    t.index ["uuid"], name: "index_kudos_achievement_groups_on_uuid", unique: true
  end

  create_table "kudos_achievements", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.string "award_name", null: false
    t.integer "rank"
    t.integer "points"
    t.jsonb "title", default: {}, null: false
    t.jsonb "description", default: {}, null: false
    t.bigint "kudos_achievement_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_name"], name: "index_kudos_achievements_on_award_name"
    t.index ["kudos_achievement_group_id"], name: "index_kudos_achievements_on_kudos_achievement_group_id"
    t.index ["uuid"], name: "index_kudos_achievements_on_uuid", unique: true
  end

  create_table "kudos_users_achievements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "kudos_achievement_id", null: false
    t.boolean "notified", default: false, null: false
    t.integer "rank"
    t.integer "points"
    t.jsonb "title", default: {}, null: false
    t.jsonb "description", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kudos_achievement_id"], name: "index_kudos_users_achievements_on_kudos_achievement_id"
    t.index ["user_id", "kudos_achievement_id"], name: "kudos_users_achievements_unique_index", unique: true
    t.index ["user_id"], name: "index_kudos_users_achievements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "kudos_achievements", "kudos_achievement_groups"
  add_foreign_key "kudos_users_achievements", "kudos_achievements"
  add_foreign_key "kudos_users_achievements", "users"
end
