require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require "psych"

helpers do
  # returns an Integer
  # determines the total number of interests of all users
  def count_interests

  end
end

before do
  @users = Psych.load_file "data/users.yaml"
end

get "/" do
  erb :index
end

get "/:user" do
  @user = params['user']
  @user_info = @users[@user.downcase.to_sym]

  erb :user
end
