user 'myuser' do
  supports :manage_home => true
  home '/home/myuser'
end
user 'testuser' do
  supports :manage_home => true
  home '/home/testuser'
  shell 'sbin/nologin'
end 
user 'firstuser' do
  supports :manage_home => true
  home '/home/firstuser'
  password '$1$oJbMObxR$8YGbtshOA5/FNAOX1HVuO1'
  shell '/bin/bash'     #This resource has successfully executed
end
 