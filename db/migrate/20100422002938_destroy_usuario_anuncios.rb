class DestroyUsuarioAnuncios < ActiveRecord::Migration
  def self.up
    #drop_table :usuario_anuncios
    add_column :anuncios, :usuario_id, :integer
  end

  def self.down
    #create_table :usuario_anuncios do |t|
    #  t.references :usuario
    #  t.references :anuncio

     # t.timestamps
    #end
    remove_column :anuncios, :usuario_id
  end
end
