class Admin::CategoriasController < Admin::AdminController
	before_filter do |c|
                c.send(:check_authentication, 0)
  end
  def index
    @categorias = Categoria.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @categoria = Categoria.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end

  def create
    @categoria = Categoria.new(params[:categoria])

    respond_to do |format|
      if @categoria.save
        flash[:notice] = 'Categoria cadastrada com sucesso.'
        format.html { redirect_to(admin_categorias_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      if @categoria.update_attributes(params[:categoria])
        flash[:notice] = 'Categoria alterada com sucesso.'
        format.html { redirect_to(admin_categorias_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy

    respond_to do |format|
      format.html { redirect_to(admin_categorias_url) }
      format.xml  { head :ok }
    end
  end
end
