set :hosts, ["web1", "web2"]
set :user, 'deploy'

task :helloworld do
  puts "helloworld"
  # run('echo hello world!')
end

task :updatecode do 
  puts "git pull"
  # run('git pull')
  # with(:settings => {:user => 'web'}) do
  #   cd('folder')
  #   lcd('local_folder')
  #   with(settings: {warnonly: true, user: "deploy"}, cd: "$RAILS_ROOT") do
  #     helloworld
  #     run('mv file.text file.back')
  #   end
  # end 
end

task :all do
  helloworld
  updatecode
end

# $> orchestra task
# $> orchestra -P task 
# $> orchestra task helloworld -H web1,web2