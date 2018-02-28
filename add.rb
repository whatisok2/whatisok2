user = ARGV[0]
email = ARGV[1]

puts `git remote add #{user} git@github.com-#{user}:#{user}/#{user}.git`
puts `ssh-keygen -t rsa -C '#{email}' -f ~/.ssh/id_rsa_#{user}`

File.open(File.expand_path('~/.ssh/config'), 'a') do |file|
  file.puts "

Host github.com-#{user}
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_#{user}
  IdentitiesOnly yes

"
end

File.open(File.expand_path('~/update'), 'a') do |file|
  file.puts "\ngit push #{user} HEAD:m"
end

puts File.read(File.expand_path("~/.ssh/id_rsa_#{user}.pub"))
