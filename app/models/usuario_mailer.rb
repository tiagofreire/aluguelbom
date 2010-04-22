class UsuarioMailer < ActionMailer::Base
  def signup_notification(usuario)
    setup_email(usuario)
    @subject    += 'Ativação de conta'
  
    @body[:url]  = "http://#{request.env	['HTTP_HOST']}/activate/#{usuario.activation_code}"
  
  end
  
  def activation(usuario)
    setup_email(usuario)
    @subject    += 'Conta ativada com sucesso'
    @body[:url]  = "http://#{request.env['HTTP_HOST']}"
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
