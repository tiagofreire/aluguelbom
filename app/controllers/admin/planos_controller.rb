class Admin::PlanosController < Admin::AdminController
  before_filter do |c|
    c.send(:check_authentication, 0)
  end
  def index
    @planos = Plano.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @plano = Plano.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  def new
    @plano = Plano.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  def edit
    @plano = Plano.find(params[:id])
  end
  def create
    @plano = Plano.new(params[:plano])
    respond_to do |format|
      if @plano.save
        flash[:notice] = 'Plano cadastrado com sucesso.'
        format.html { redirect_to(admin_planos_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  def update
    @plano = Plano.find(params[:id])
    respond_to do |format|
      if @plano.update_attributes(params[:plano])
        flash[:notice] = 'Plano alterado com sucesso.'
        format.html { redirect_to(admin_planos_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  def destroy
    @plano = Plano.find(params[:id])
    @plano.destroy
    respond_to do |format|
      format.html { redirect_to(admin_planos_url) }
    end
  end
end
