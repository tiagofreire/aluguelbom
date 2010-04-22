class Categoria < ActiveRecord::Base
  has_many :subcategorias

  validates_presence_of :descricao
  
end
