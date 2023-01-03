def jammy?
  return true if platform?('ubuntu') && node['platform_version'] == '22.04'
  false                                                                      
end 

%w[
  devtools
  git
  openssh-client
  vim
  wget
].each |pkg| do
  package pkg
end

package 'clangd-12' do
  only_if jammy?
end

docker_installation_package 'default' do
end
