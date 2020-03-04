# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_03_231504) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "klass_id"
    t.integer "race_id"
    t.index ["klass_id"], name: "index_characters_on_klass_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "klass_name"
    t.string "weapon"
    t.string "item"
  end

  create_table "races", force: :cascade do |t|
    t.string "race_name"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
  end

end
