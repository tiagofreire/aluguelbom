class Admin::SubcategoriasController < Admin::AdminController
	before_filter do |c|
                c.send(:check_authentication, 0)
        end
	
  def index
    @subcategorias = Subcategoria.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @subcategoria = Subcategoria.find(params[:id])

    respond_to do |format|
      format.html 
    end
  end

  def new
    @subcategoria = Subcategoria.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @subcategoria = Subcategoria.find(params[:id])
  end

  def create
    @subcategoria = Subcategoria.new(params[:subcategoria])

    respond_to do |format|
      if @subcategoria.save
        flash[:notice] = 'Subcategoria cadastrada com sucesso.'
        format.html { redirect_to(admin_subcategorias_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @subcategoria = Subcategoria.find(params[:id])

    respond_to do |format|
      if @subcategoria.update_attributes(params[:subcategoria])
        flash[:notice] = 'Subcategoria alterada com sucesso.'
        format.html { redirect_to(admin_subcategorias_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @subcategoria = Subcategoria.find(params[:id])
    @subcategoria.destroy

    respond_to do |format|
      format.html { redirect_to(admin_subcategorias_url) }
      format.xml  { head :ok }
    end
  end
end
