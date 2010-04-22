class CreatePlanos < ActiveRecord::Migration
  def self.up
    create_table :planos do |t|
      t.string :nome, :limit => 80
      t.integer :num_anuncios
      t.ingeter :quant_imagens_anuncio
      t.integer :expira_anuncio
      t.references :usuario
      t.float :valor
      t.integer :status

      t.timestamps
    end
    add_index :planos, [:nome, :usuario_id]
  end

  def self.down
    drop_table :planos
  end
end
