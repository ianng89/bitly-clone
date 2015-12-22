require 'byebug'
get '/' do

	@urls = Url.all

  erb :"static/index"
end

post '/urls' do
	# byebug
	@url = Url.create(long_url: params[:long_url])
	redirect to '/'
end

get '/:short_url' do


end
