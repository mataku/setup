execute 'apt-get update' do
  command 'sudo apt update -q'
end

%w(build-essential software-properties-common).each do |pack|
  package pack
end

# execute 'Prepare emacs packages' do
#   command 'add-apt-repository -y ppa:kelleyk/emacs'
# end

execute 'Install dependencies' do
  %w(
    curl
    openjdk-8-jdk
    openjdk-11-jdk
    rbenv
    emacs
  ).each do |dep|
    command "sudo apt install -y #{dep}"
  end
end
