class CreateAnuncios < ActiveRecord::Migration
  def self.up
    create_table :anuncios do |t|
      t.string :titulo, :limit => 80
      t.text :descricao
      t.references :subcategoria
      t.references :cidade
      t.float :valor
      t.string :video,:limit =>100
      t.string :tags,:limit => 120
      t.integer :status

      t.timestamps
    end
    add_index :anuncios, [:titulo,:tags]
  end

  def self.down
    drop_table :anuncios
  end
end
