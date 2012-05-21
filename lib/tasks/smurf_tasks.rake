# desc "Explaining what the task does"
# task :smurf do
#   # Task goes here
# end

desc "Export color variables"
task :smurftest do
  #Smurf::ColorVariableParser.sass_directory = "/home/jk/rails/lysbon/app/assets/stylesheets/9flats"
  puts Smurf::ColorVariableParser.parse_sass_directory "/home/jk/rails/lysbon/app/assets/stylesheets/9flats"
end
