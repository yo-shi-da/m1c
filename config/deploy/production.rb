server '3.114.123.18', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/dic/.ssh/id_rsa'