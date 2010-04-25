class Anuncio < ActiveRecord::Base
  belongs_to :subcategoria
  belongs_to :cidade
  validates_presence_of :titulo,:descricao, :subcategoria_id, :cidade_id, :usuario_id
end
