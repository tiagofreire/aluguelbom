class CreateCategorias < ActiveRecord::Migration
  def self.up
    create_table :categorias do |t|
      t.string :descricao, :limit => 80
      t.timestamps
    end
	add_index :categorias, :descricao
  end

  def self.down
    drop_table :categorias
  end
end
