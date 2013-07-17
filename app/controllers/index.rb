get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.new(url: params[:url], click_count: 0)

  if @url.invalid?
    @errors = @url.errors.messages
  end
  # full_url: string, short_url: string, counter: integer
  erb :url
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  @url.click_count += 1

  @url.save 
  redirect "#{@url.url}"
end
