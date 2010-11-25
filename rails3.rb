
template_path = File.join(File.dirname(__FILE__), 'templates')
template_path = 'http://jruby.org/templates' unless File.exists? template_path

opts = Hash.new(false)
if ARGV.index('--template-options')
  %r{--template-options\s*(['"]?)([\w,]*)(\1)}.match(ARGV.join(' '))[2].downcase.split(',').each {|k| opts[k.to_sym] = true}
  opts.default = true if opts[:all]
else
  %w(RVM Haml jQuery RSpec).each do |k|
    puts "Use #{k}? [Y/n]"
    opts[k.downcase.to_sym] = STDIN.readline.chomp =~ /^[yY]?$/
  end
end

apply File.join(template_path, 'rvm.rb') if opts[:rvm] 
log 'Configuring for git...'
apply File.join(template_path, 'git.rb') unless ARGV.index('--skip-git')
apply File.join(template_path, 'default.rb')
apply File.join(template_path, 'haml.rb') if opts[:haml]
apply File.join(template_path, 'jquery.rb') if opts[:jquery]
apply File.join(template_path, 'rspec.rb') if opts[:rspec]

docs = <<-DOCS
Run the following commands to complete the setup of #{app_name.humanize}:

% cd #{app_name}
% gem install bundler
% bundle install
#{"% script/rails generate rspec:install\n" if opts[:rspec]}
DOCS

log docs
