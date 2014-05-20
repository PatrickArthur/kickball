require 'sinatra'
require 'csv'

def filter_roster(group_by, group_by_value, descriptor)
  roster = []
  CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
    roster << "#{row["first_name"]} #{row["last_name"]}, #{row[descriptor]}" if row[group_by] == group_by_value
  end
  roster
end

helpers do

def link_to(url,text=url,opts={})
  attributes = ""
  opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
  "<a href=\"#{url}\" #{attributes}>#{text}</a>"
end

end


get '/teams/:team_name' do
  @title = params[:team_name]
  @list_items = filter_roster("team",@title, "position")
  # The :task_name is available in our params hash
  erb :show
end

get '/positions/:position_name' do
  @title = params[:position_name]
  @list_items = filter_roster("position",@title, "team")
  # The :task_name is available in our params hash
  erb :show
end


# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
