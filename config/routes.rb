Rails.application.routes.draw do
  # root "articles#index"

  # endpoint de api versionada
  namespace :api, type: :json do
    namespace :v1, type: :json do
      post '/mutant', to: 'dna_check#mutant'
      get '/stats', to: 'dna_check#stats'
    end
  end

  # endpoint no versionado
  post '/mutant', to: 'api/v1/dna_check#mutant', type: :json
  get '/stats', to: 'api/v1/dna_check#stats', type: :json
end
