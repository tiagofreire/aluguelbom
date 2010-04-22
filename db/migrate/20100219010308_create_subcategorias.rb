class CreateSubcategorias < ActiveRecord::Migration
  def self.up
    create_table :subcategorias do |t|
      t.string :descricao, :limit => 80
      t.references :categoria

      t.timestamps
    end
    add_index :subcategorias, :descricao
    add_index :subcategorias, :categoria_id
  end

  def self.down
    drop_table :subcategorias
  end
end
