Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post '/graphql', to: 'graphql#execute'

  namespace :users do
    resources :sessions, only: [:index, :create] do
      collection do
        delete :destroy
      end
    end
    resources :registrations, only: [:index, :create]
  end

  namespace :account do
    resource :profile, only: [:show, :edit, :update]

    resources :posts
  end

  resources :posts, only: :show

  root to: 'posts#index'

  get '*unmatched_route', to: 'errors#not_found', as: :page_not_found
end
