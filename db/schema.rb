# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150920201112) do

  create_table "administradors", force: true do |t|
    t.text     "nombres"
    t.text     "apellidos"
    t.text     "correo"
    t.text     "empresa"
    t.text     "usuario"
    t.text     "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concursos", force: true do |t|
    t.text     "nombre"
    t.text     "banner"
    t.text     "url"
    t.datetime "fechaini"
    t.datetime "fechafin"
    t.text     "premio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "administrador_id"
  end

  add_index "concursos", ["administrador_id"], name: "index_concursos_on_administrador_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "videos", force: true do |t|
    t.text     "nombres"
    t.text     "apellidos"
    t.text     "correo"
    t.text     "fecha"
    t.text     "estado"
    t.text     "archivo"
    t.text     "archivoconvertido"
    t.datetime "fechainiconversion"
    t.datetime "fechafinconversion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "concurso_id"
    t.string   "mensaje"
  end

  add_index "videos", ["concurso_id"], name: "index_videos_on_concurso_id", using: :btree

end
