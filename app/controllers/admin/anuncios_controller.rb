class Admin::AnunciosController < Admin::AdminController
  before_filter do |c|
    c.send(:check_authentication, 3)
  end
  uses_tiny_mce
  def index
    if current_usuario.tipo_usuario_id == 1
      @anuncios = Anuncio.all(:conditions => ["usuario_id = ?",current_usuario.id])
    else
      @anuncios = Anuncio.all
    end
    respond_to do |format|
      format.html
    end
  end

  def show
    @anuncio = Anuncio.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @anuncio = Anuncio.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @anuncio = Anuncio.find(params[:id])
  end

  def create
    @anuncio = Anuncio.new(params[:anuncio])

    respond_to do |format|
      if @anuncio.save
        flash[:notice] = 'Anuncio cadastrada com sucesso.'
        format.html { redirect_to(admin_anuncios_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @anuncio = Anuncio.find(params[:id])

    respond_to do |format|
      if @anuncio.update_attributes(params[:anuncio])
        flash[:notice] = 'Anuncio alterada com sucesso.'
        format.html { redirect_to(admin_anuncios_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @anuncio = Anuncio.find(params[:id])
    @anuncio.destroy

    respond_to do |format|
      format.html { redirect_to(admin_anuncios_url) }
      format.xml  { head :ok }
    end
  end
  def mostrar_cidade
    if params[:estado_id] == ""
      render :text => '<select><option value="" >--Selecione um estado--</option></select>'
    else    
      render :inline => "<%= collection_select 'anuncio', :cidade_id, Cidade.all(:select => 'id, nome', :conditions => 'estado_id = #{params[:estado_id]}', :order=> 'nome'), :id, :nome, {:prompt => 'Escolha uma cidade'}%>"
    end
  end
  def mostrar_subcategoria
    if params[:categoria_id] == ""
      render :text => '<select><option value="" >--Selecione uma categoria--</option></select>'
    else    
      render :inline => "<%= collection_select 'anuncio', :subcategoria_id, Subcategoria.all(:select => 'id, descricao', :conditions => 'categoria_id = #{params[:categoria_id]}', :order=> 'descricao'), :id, :descricao, {:prompt => 'Escolha uma categoria'}%>"
    end
  end

end
