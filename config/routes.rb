SampleApp::Application.routes.draw do
  
  # root :to => "welcome#index"
  
  get "pages/home"

  get "pages/contact"
  
  get "pages/about"
  
end
