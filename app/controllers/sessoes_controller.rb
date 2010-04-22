# This controller handles the login/logout function of the site.  
class SessoesController < ApplicationController
	layout 'login'
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.rhtml
  def new
  end

  def create
    logout_keeping_session!
    usuario = Usuario.authenticate(params[:login], params[:password])
    if usuario
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_usuario = usuario
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      flash[:notice] = "Login efetuado com sucesso"
      redirect_back_or_default('/admin')
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      flash[:error] = "Falha ao autenticar, verificar dados"
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    #flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Não pode fazer login como '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
