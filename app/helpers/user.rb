helpers do 
  def check_log_in
    session[:user_id] == nil ? nil : User.find(session[:user_id])
  end

end
