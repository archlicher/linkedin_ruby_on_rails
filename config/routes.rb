Rails.application.routes.draw do

	root 'demo#index'

	get 'demo/index'
	get 'demo/hello'
	get 'demo/other_hello'
	get 'demo/lynda'

end
