class UsuariosController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @usuario = Usuario.new
  end
 
  def create
    logout_keeping_session!
    @usuario = Usuario.new(params[:usuario])
    success = @usuario && @usuario.save
    if success && @usuario.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Obrigado por se cadastrar, visite seu e-mail para ativar sua conta."
    else
      #flash[:error]  = "Erro ao cadastrar-se, por favor entre em contato com a administração ."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    usuario = Usuario.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && usuario && !usuario.active?
      usuario.activate!
      flash[:notice] = "Cadastro completo."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "Codigo de ativação vazio, por favor verifique seu email e utilize o link correto."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "Código de ativação inválido, por favor verifique seus dados."
      redirect_back_or_default('/')
    end
  end
  def mostrar_cidade
    if params[:estado_id] == ""
      render :text => '<select><option value="" >--Selecione um estado--</option></select>'
    else    
      render :inline => "<%= collection_select 'usuario', :cidade_id, Cidade.all(:select => 'id, nome', :conditions => 'estado_id = #{params[:estado_id]}', :order=> 'nome'), :id, :nome, {:prompt => 'Escolha uma cidade'}%>"
    end
  end
end
