execute 'Install golang packages' do
  %w(rogpeppe/godef golang/lint/golint kisielk/errcheck).each do |v|
    command "go get #{v}"
  end
  command 'go get -u github.com/nsf/gocode'
end
