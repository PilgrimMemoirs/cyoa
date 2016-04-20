require 'sinatra'


get '/' do
	@title = "Welcome"
	@content = "How you feeling?"

	@options = ["pooped", "great"]

	erb :general
end


#Decision calls on several methods to determine the components needed to display
get '/decision/:option'
	option = params[:option]

	@title = Cyoa.get_title(option)
	@story = Cyoa.get_story(option)

	@options = Cyoa.get_options(option)

	erb :general
end

#Result calls a method that returns a hash of all the compents needed to display a result
get 'ending/:result' do
	@result = Cyoa.ending(params[:result])

	erb :result
end