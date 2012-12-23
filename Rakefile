require "bundler/gem_tasks"
require "rake/testtask"

task :default => :test
Rake::TestTask.new do |t|
  t.pattern = "test/unit/**/*_test.rb"
  t.verbose = true
end

Rake::TestTask.new("test:all") do |t|
  t.pattern = "test/gallery/**/*_test.rb"
  t.verbose = true
end

Rake::TestTask.new("test:all_good") do |t|
  t.pattern = "test/gallery/**/good_test.rb"
  t.verbose = true
end

Rake::TestTask.new("spec:all") do |t|
  t.pattern = "test/gallery/**/*_spec.rb"
  t.verbose = true
end

Rake::TestTask.new("spec:all_good") do |t|
  t.pattern = "test/gallery/**/good_spec.rb"
  t.verbose = true
end


REPORTER = "FastFailReporter"

def run_with(reporter, task_name)
  puts "Running gallery tests using #{reporter}..."
  sh "rake #{task_name} REPORTER=#{reporter} " do
    # Ignore failures. They're expected when you are running the gallery
    # test suite.
  end
end

task "gallery:test" do
  run_with REPORTER, "test:all"
end

task "gallery:test_good" do
  run_with REPORTER, "test:all_good"
end

task "gallery:spec" do
  run_with REPORTER, "spec:all"
end

task "gallery:spec_good" do
  run_with "REPORTER", "spec:all_good"
end
