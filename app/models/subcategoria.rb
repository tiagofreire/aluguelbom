class Subcategoria < ActiveRecord::Base
  belongs_to :categoria
  has_many :anuncios
end
