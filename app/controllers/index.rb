get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  url = params[:url]
  Url.new(full_url: url, short_url: 'DO SOMETHING', click_count: 0)
  # full_url: string, short_url: string, counter: integer
end

get '/:short_url' do

end
