group 'sample' do
  action :create
end

user 'sample' do
  username 'sample'
  group 'sample'
  home '/home/sample'
  shell '/bin/bash'
  action :create
end
