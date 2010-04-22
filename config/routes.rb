ActionController::Routing::Routes.draw do |map|
  
  map.resource :sessao
  map.resources :usuarios
  map.logout '/sair', :controller => 'sessoes', :action => 'destroy'
  map.login '/entrar', :controller => 'sessoes', :action => 'new'
  map.register '/registro', :controller => 'usuarios', :action => 'create'
  map.signup '/cadastro', :controller => 'usuarios', :action => 'new'
  map.ativar '/ativar/:activation_code', :controller => 'usuarios', :action => 'activate', :activation_code => nil

  map.lista_de_anuncios "lista_de_anuncios/:subcategoria_id", :controller => 'anuncios', :action => 'index'
  map.produto "produto/:anuncio_id", :controller => 'anuncios', :action => 'produto'
  map.detalhes_planos "detalhes_plano/:plano_id", :controller => 'admin/principal', :action => 'detalhes_plano'

  map.namespace :admin do |admin|
    admin.resources :principal, :collection => {:mostra_detalhe_plano => :get}
    admin.resources :categorias
    admin.resources :subcategorias
    admin.resources :anuncios
    admin.resources :usuario_planos
    admin.resources :usuario_anuncios
    admin.root :controller => "principal"
  end

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "principal"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
