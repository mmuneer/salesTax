namespace :tests do
  require 'rake/testtask'
  desc "Run all the tests"
  Rake::TestTask.new(:all) do |t|
    t.libs    = ['lib']
    t.pattern = 'tests/**/*_test.rb'
  end
end

task :tests => 'tests:all'

task :default => :tests