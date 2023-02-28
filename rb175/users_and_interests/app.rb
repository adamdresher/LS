require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require "psych" # equivalent to "yaml"

helpers do
  # determines the total number of unique interests of all users
  # returns an Integer
  def count_interests(users)
    users.map { |_, v| v[:interests] }.flatten.uniq.count
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
  @email = @users[@user.downcase.to_sym][:email]
  @interests = @users[@user.downcase.to_sym][:interests]

  erb :user
end
