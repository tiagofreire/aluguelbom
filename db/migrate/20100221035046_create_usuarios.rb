class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table "usuarios", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :nome,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code,           :string, :limit => 40
      t.column :activated_at,              :datetime

      #
      t.string :endereco, :limit => 255
      t.string :bairro, :limit =>  120
      t.integer :cep, :limit => 9
      t.references :cidade
      t.string :telefone, :limit => 10
      t.string :celular, :limit => 10
      t.string :fax, :limit => 10
      # 0 = Administrador 1 = Usuario comum
      t.integer :tipo_usuario_id
      #
    end
    add_index :usuarios, :login, :unique => true
         say_with_time "Criando conta do administrador" do
                Usuario.new do |a|
                        a.login = 'admin'
                        a.email = 'rafarubert@yahoo.com.br'
                        a.nome = 'Administrador'
                        a.tipo_usuario_id = 0
                        a.crypted_password = '7f9dd922ab8a9c411c3315df869f65f2aadadef7'
                        a.salt = '51514aa306c2501834ac942f97cf8cfb0d160097'
			a.activated_at = Time.now
                        a.save
                end
         end
  end

  def self.down
    drop_table "usuarios"
  end
end
