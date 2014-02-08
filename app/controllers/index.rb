get '/' do
  @albums = Album.order(updated_at: :desc)
  @user = check_log_in
  erb :index
end

#User
get '/sign-out' do
  session.clear
  redirect '/'
end 

get '/sign-up' do
  erb :sign_up
end 

post '/sign-up' do
  user = User.create(params)
  session[:user_id] = user.id
  redirect '/'
end 

get '/sign-in' do
  erb :sign_in
end 

post '/sign-in' do
  user = User.login(params)
  session[:user_id] = user.id
  redirect '/'
end 

#albums
get '/add_albums' do
  @user = check_log_in
  erb :add_albums
end

post '/add_albums' do
  user = User.find(session[:user_id])
  album = Album.new(name: params[:name])
  user.albums << album
  redirect "/users/<%= @user.id %>/albums"
end

get '/users/:user_id/albums' do
  user = User.find(params[:user_id])
  @albums = user.albums.order(updated_at: :desc)
  @user = check_log_in
  erb :index
end

#photos

get '/album/:album_id/photos' do
  @album = Album.find(params[:album_id])
  @photos = @album.photos.order(created_at: :desc)
  @user = check_log_in
  erb :photos
end

get '/album/:album_id/upload' do
  @album =Album.find(params[:album_id])
  @user = check_log_in
  erb :upload
end  

post '/album/:album_id/upload' do 
  photo = Photo.new(album_id: params[:album_id])
  photo.file = params[:myfile]
  photo.save
  redirect "/album/#{params[:album_id]}/photos"
end