class Plano < ActiveRecord::Base
  belongs_to :usuario
  #has_one :anuncios, :through => :anuncio_planos
  #accepts_nested_attributes_for :anuncios, :allow_destroy => true
  validates_presence_of :nome, :num_anuncios, :valor
end
