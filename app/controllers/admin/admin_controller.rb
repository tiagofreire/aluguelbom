class Admin::AdminController < ApplicationController
	layout 'admin/admin'
	include AuthenticatedSystem
  before_filter :verifica_plano
  
  def verifica_plano
    if current_usuario and current_usuario.tipo_usuario_id == 1
      if params[:controller].to_s != "admin/principal" 
        if UsuarioPlano.count(:conditions => ["usuario_id = ?", current_usuario.id]) < 1
            flash[:warning] = "Você ainda não possui um plano, por favor adquira um plano antes de continuar"
			      redirect_to("/admin/principal")
          end
      end
    end
  end
	def check_authentication (*nivel)
		nivel = nivel.to_a
		if !logged_in?
			flash[:error] = "Você não tem permissão para acessar a página, efetue login"
			redirect_to("/entrar")
		else
			# 0 = usuário Administrador
			# 1 = Usuário Comum
			# 3 = Todos os usuários
			if nivel.include? 3
			elsif !nivel.include?(current_usuario.tipo_usuario_id)
				flash[:warning] = "Você não tem permissão para acessar esta página"
				redirect_to("/admin")
			end
		end
	end
end
