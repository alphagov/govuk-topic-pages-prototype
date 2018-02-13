Rails.application.routes.draw do
  get "/healthcheck", to: proc { [200, {}, ["OK"]] }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "welcome#index"

  get "/topics", to: "topics#index"

  get "/topics/*path/:document_type", to: "tagged_content#show", constraints: DocumentTypeConstraint.new

  get "/topics/*path", to: "topics#show"
end
