class UsuarioAnuncio < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :anuncio
end
