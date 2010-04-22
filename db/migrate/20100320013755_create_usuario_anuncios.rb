class CreateUsuarioAnuncios < ActiveRecord::Migration
  def self.up
    create_table :usuario_anuncios do |t|
      t.references :usuario
      t.references :anuncio

      t.timestamps
    end
  end

  def self.down
    drop_table :usuario_anuncios
  end
end
