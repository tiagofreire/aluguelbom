class DestroyAnuncioPlano < ActiveRecord::Migration
  def self.up
        drop_table :anuncio_planos
  end

  def self.down
    create_table :anuncio_planos do |t|
      t.references :plano
      t.references :anuncio

      t.timestamps
    end
    add_index :anuncio_planos, [:plano_id, :anuncio_id]
  end
end
