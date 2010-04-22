class CreateUsuarioPlanos < ActiveRecord::Migration
  def self.up
    create_table :usuario_planos do |t|
      t.references :usuario
      t.references :plano

      t.timestamps
    end
  end

  def self.down
    drop_table :usuario_planos
  end
end
