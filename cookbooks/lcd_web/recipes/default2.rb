#
# Cookbook:: lcd_web
# Recipe:: default
#
# Copyright:: 2017, Student Name, All Rights Reserved.
#
#
#['net-tools','httpd'].each do |pkg|
#   package pkg
#end
#
#service 'httpd' do
#     action [:enable,:start]
#end
lazy_message = 'Hello World'

file 'lazy_message' do 
     path '/tmp/lazy.txt'
     content "#{lazy_message}"
end

execute 'yum-makecache' do
    command 'yum makecache'
    notifies :create, 'file[message]', :immediately
    action :nothing
end

package 'bind-utils' do
    action :install
    notifies :run, 'execute[yum-makecahce]', :before
end

file 'message' do
    path '/tmp/message.txt'
    content lazy { "#{lazy_message}" }
end

lazy_message = 'Goodbye World'



