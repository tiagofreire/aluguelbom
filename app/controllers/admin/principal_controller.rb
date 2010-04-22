class Admin::PrincipalController < Admin::AdminController
  before_filter do |c|
    c.send(:check_authentication, 3)
  end

  layout 'admin/admin'
  def index
    if current_usuario.tipo_usuario_id == 1 and UsuarioPlano.count(:conditions => ["usuario_id = ?", current_usuario.id]) < 1
      @usuario_plano = UsuarioPlano.new
    else
     @usuario_plano = UsuarioPlano.first(:conditions => ["usuario_id = ?", @current_usuario.id])
    end
  end
  def add_plano
    @usuario_plano = UsuarioPlano.new(params[:usuario_plano])

    respond_to do |format|
      if @usuario_plano.save
        flash[:notice] = 'Plano cadastrado com sucesso.'
        format.html { redirect_to(:action => "index") }
      else
        format.html { render :action => "index" }
      end
    end
  end
  def mostra_detalhe_plano
    if params[:plano_id] == ''
      render :text => "[Escolha um plano]"
    else
     render :inline => "<%= link_to_modal \"[Detalhes do plano]\", \"detalhes_plano\", #{params[:plano_id]}, \"Sobre o plano\"%>"
    end
  end
  def detalhes_plano
    @plano = Plano.find(params[:plano_id])
    render :partial => "detalhes_plano", :layout => false
  end
end
