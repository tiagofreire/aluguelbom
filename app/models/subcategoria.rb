class Subcategoria < ActiveRecord::Base
  belongs_to :categoria
  has_many :anuncios
  validates_presence_of :categoria_id, :descricao 
end
