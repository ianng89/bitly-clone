require 'byebug'
get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do
	# byebug
	@url = Url.create(long_url: params[:long_url])
	# redirect to '/urls/' + params[:long_url]
	# if shorten.save
 #        @msg = "URL is shortened"
 #      else 
 #        @msg = "URL is invalid, please try again."
 #      end
	# redirect to '/'
	@urls = Url.all
 	erb :"static/index"
end

# get '/urls/:long_url' do
#   @url = Url.find_by(long_url: params[:long_url])
#   erb :"static/show"

# end

get '/:short' do
	#redirect to appropriate "long" URL
	@url = Url.find_by(short_url: params[:short])
	@url.click_count += 1
	@url.save
	redirect "#{@url.long_url}"
	# 
end