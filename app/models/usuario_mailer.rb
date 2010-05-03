class UsuarioMailer < ActionMailer::Base
  def signup_notification(usuario)
    setup_email(usuario)
    @subject    += 'Ativação de conta'
    #TODO: Ao colocar em produção descomentar linha e comentar abaixo 
    #@body[:url]  = "http://#{request.env['HTTP_HOST']}/activate/#{usuario.activation_code}"
    #@body[:url]  = "http://localhost:3000/ativar/#{usuario.activation_code}"
    @body[:url]  = "http://www.natalsemfome.org/ativar/#{usuario.activation_code}"
  
  end
  
  def activation(usuario)
    setup_email(usuario)
    @subject    += 'Conta ativada com sucesso'
    #TODO: Ao colocar em produção descomentar linha e comentar abaixo 
    #@body[:url]  = "http://#{request.env['HTTP_HOST']}"
    #@body[:url]  = "http://localhost:3000"
    @body[:url]  = "http://www.natalsemfome.org"
  end
  
  protected
    def setup_email(usuario)
      @recipients  = "#{usuario.email}"
      @from        = "Administração"
      @subject     = "[ALUGUEL BOM] "
      @sent_on     = Time.now
      @body[:usuario] = usuario
    end
end
