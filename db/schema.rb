# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100422002938) do

  create_table "anuncios", :force => true do |t|
    t.string   "titulo",          :limit => 80
    t.text     "descricao"
    t.integer  "subcategoria_id"
    t.integer  "cidade_id"
    t.float    "valor"
    t.string   "video",           :limit => 100
    t.string   "tags",            :limit => 120
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
  end

  add_index "anuncios", ["titulo", "tags"], :name => "index_anuncios_on_titulo_and_tags"

  create_table "categorias", :force => true do |t|
    t.string   "descricao",  :limit => 80
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorias", ["descricao"], :name => "index_categorias_on_descricao"

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidades", ["estado_id"], :name => "index_cidades_on_estado_id"
  add_index "cidades", ["nome"], :name => "index_cidades_on_nome"

  create_table "estados", :force => true do |t|
    t.string   "sigla"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estados", ["sigla"], :name => "index_estados_on_sigla"

  create_table "planos", :force => true do |t|
    t.string   "nome",           :limit => 80
    t.integer  "num_anuncios"
    t.integer  "expira_anuncio"
    t.integer  "usuario_id"
    t.float    "valor"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "planos", ["nome", "usuario_id"], :name => "index_planos_on_nome_and_usuario_id"

  create_table "subcategorias", :force => true do |t|
    t.string   "descricao",    :limit => 80
    t.integer  "categoria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategorias", ["categoria_id"], :name => "index_subcategorias_on_categoria_id"
  add_index "subcategorias", ["descricao"], :name => "index_subcategorias_on_descricao"

  create_table "usuario_planos", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "plano_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "nome",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "endereco"
    t.string   "bairro",                    :limit => 120
    t.integer  "cep"
    t.integer  "cidade_id"
    t.string   "telefone",                  :limit => 10
    t.string   "celular",                   :limit => 10
    t.string   "fax",                       :limit => 10
    t.integer  "tipo_usuario_id"
  end

  add_index "usuarios", ["login"], :name => "index_usuarios_on_login", :unique => true

end
