Rails.application.routes.draw do
  resources :clientes do
    resources :vendas do
      resources :pagamentos, only: %i[edit update destroy]
    end
  end

  root to: "clientes#index" 

end
