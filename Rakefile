require "rake"
require "rake/testtask"

begin
  require "pry"
rescue LoadError
end

desc "Show the list of Rake tasks (rake -T)"
task :help do
  sh "rake -T"
end

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) 

  task :default => :spec
rescue LoadError
  # no rspec available
end

def build(os, org="intelsdi")
  raise "Error: missing operating system" unless os
  raise "Error: invalid operating system #{os}" unless File.exists? "#{os}/Dockerfile"
  sh "docker build -t #{org}/snap:#{os} --build-arg BUILD_DATE=$(date +%Y-%m-%d) -f #{os}/Dockerfile ."
end

def containers
  @os ||= Dir.glob('*').select {|f| File.directory? f and File.exists? "#{f}/Dockerfile" }
end

namespace :build do
  containers.each do |os|
    desc "build docker container for #{os}"
    task os.to_sym, [:org] do |t, args|
      org = args[:org] || "intelsdi"
      build os, org
    end
  end

  desc "buils all docker containers"
  task :all, [:org] do |t, args|
    containers.each do |os|
      org = args[:org] || "intelsdi"
      build os, org
    end
  end
end

namespace :docker do
  desc "ensure base containers are up to date."
  task :pull do
    images = containers.collect do |os|
      from = File.readlines("#{os}/Dockerfile").select{ |l| l =~ /^FROM/}
      image = from.first.chomp.split(" ").last
    end
    images.uniq.each do |i|
      sh "docker pull #{i}"
    end
  end

  desc "push containers to docker hub."
  task :push do
    containers.each do |os|
      sh "docker push intelsdi/snap:#{os}"
    end
  end
end
