Introspector::Application.routes.draw do
  root "test#index"
  get '/test' => 'test#expected_files'
  get '/ignored' => 'test#out_ignore'
end