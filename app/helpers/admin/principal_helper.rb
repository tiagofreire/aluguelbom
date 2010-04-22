module Admin::PrincipalHelper
  def planos_for_select
    Plano.all(:select => "id,nome", :order => :nome).collect {|p| [ p.nome, p.id ] }
  end
end
