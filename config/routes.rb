Rails.application.routes.draw do
  resources :clientes do
    resources :vendas do
      resources :pagamentos, only: %i[new create edit update destroy]
    end
  end

  get '/relatorios', to: 'relatorios#index'
  root to: 'clientes#index'

end
