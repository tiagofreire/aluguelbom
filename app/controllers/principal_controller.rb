class PrincipalController < ApplicationController
  layout "principal"
  
  def index
  end
  def mostrar_cidade
    if params[:estado_id] == ""
      render :text => '<select><option value="" >--Selecione um estado--</option></select>'
    else    
      render :inline => "<%= collection_select 'usuario', :cidade_id, Cidade.all(:select => 'id, nome', :conditions => 'estado_id = #{params[:estado_id]}', :order=> 'nome'), :id, :nome, {:prompt => 'Escolha uma cidade'}%>"
    end
  end

  def mostrar_subcategoria
    if params[:categoria_id] == ""
      render :text => '<select><option value="" >--Selecione uma categoria--</option></select>'
    else    
      render :inline => "<%= collection_select 'anuncio', :subcategoria_id, Subcategoria.all(:select => 'id, descricao', :conditions => 'categoria_id = #{params[:categoria_id]}', :order=> 'descricao'), :id, :descricao, {:prompt => 'Escolha uma categoria'}%>"
    end
  end
  def busca
    conditions = ""
    joins = ""
    if params[:estado_id] != '' || params[:cidade_id] == ''
      joins << 'INNER JOIN cidades ON anuncios.cidade_id = cidades.id '
      joins << 'INNER JOIN estados  ON cidades.estado_id = estados.id '
      conditions << "AND estados.id = #{params[:estado_id]} "
    end
    if params[:cidade_id] != ''
      conditions << "AND anuncios.cidade_id = #{params[:cidade_id]} "
    end
    if params[:categoria_id] || params[:categoria_id] != '' || !params[:subcategoria_id] || params[:subcategoria_id] = ''
      conditions << "AND categorias.id = #{params[:categoria_id]} "
      joins << "INNER JOIN subcategorias ON anuncios.subcategoria_id = subcategorias.id "
      joins << "INNER JOIN categorias ON subcategorias.categoria_id = categorias.id "
    end
    if params[:subcategoria_id] and params[:subcategoria_id] != ''
      conditions << "AND anuncios.subcategoria_id = #{params[:subcategoria_id]} "
    end
    if params[:descricao] and params[:descricao] != ''
      conditions << "AND anuncios.titulo like '%#{params[:descricao]}%' "
    end
    anuncio = 'Anuncio.all('
    if joins != ''
      anuncio << ":joins => '#{joins}', "  
    end
    # if conditions != ''
    #       anuncio << " :conditions => conditions.sub('AND ','')," 
    #     end
    anuncio <<  ":order => 'anuncios.descricao')"
    anuncios = eval(anuncio)
    render :partial => 'busca', :locals =>{:anuncios => anuncios}
  end
end
