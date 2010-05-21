class AnunciosController < ApplicationController
  def index
    @anuncios = Anuncio.all( :conditions => ['subcategoria_id = ?',params[:subcategoria_id]], :order => :titulo)
  end
  def produto
    @produto = Anuncio.find(params[:anuncio_id])
  end
  def usuario
    Usuario.all(:conditions => ["login = ?", params[:usuario] ])
  end
end
