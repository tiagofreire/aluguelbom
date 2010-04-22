class CreateCidades < ActiveRecord::Migration
  def self.up
    create_table :cidades do |t|
      t.string :nome
      t.references :estado

      t.timestamps
    end
    add_index :cidades, :nome
    add_index :cidades, :estado_id

  end

  def self.down
    drop_table :cidades
  end
end
