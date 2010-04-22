class Anuncio < ActiveRecord::Base
  belongs_to :subcategoria
  belongs_to :cidade

  has_many :usuario_anuncios
  #has_one :planos, :through => :anuncio_planos
  #has_many :anuncio_planos
  #accepts_nested_attributes_for :planos, :allow_destroy => true
end
