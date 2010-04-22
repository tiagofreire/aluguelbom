class UsuarioPlano < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :plano
  validates_presence_of :usuario, :plano
end
