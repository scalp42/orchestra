set :hosts, ["web1", "web2"]

task :helloworld do
  puts "helloworld"
  # run('echo hello world!')
end

task :ls_root do 
  puts "ls_root"
  # sudo('ls -l /root')
end

task :all do
  helloworld
  ls_root
end

# $orchestra task
# $orchestra -P task 
# $orchestra task helloworld -H web1