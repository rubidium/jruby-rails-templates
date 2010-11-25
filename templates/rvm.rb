version="#{`rvm tools strings`.chomp}@#{app_name}"
rvmrc = <<-RVMRC
if [[ -d "${rvm_path:-$HOME/.rvm}/environments" \
  && -s "${rvm_path:-$HOME/.rvm}/environments/#{version}" ]] ; then
  \. "${rvm_path:-$HOME/.rvm}/environments/#{version}"
else
  rvm --create  "#{version}"
fi
RVMRC
create_file ".rvmrc", rvmrc
`rvm rvmrc trust .`
