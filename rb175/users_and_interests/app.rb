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

get "/" do
  @users = Psych.load_file "data/users.yaml"
  erb :index
end
