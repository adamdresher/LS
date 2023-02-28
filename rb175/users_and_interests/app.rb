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
  @user = params['user'].downcase.to_sym

  redirect "/" unless @users.keys.include? @user

  @email = @users[@user][:email]
  @interests = @users[@user][:interests]
  @other_users = @users.reject { |other, _| other == @user }

  erb :user
end

not_found do
  redirect "/"
end
