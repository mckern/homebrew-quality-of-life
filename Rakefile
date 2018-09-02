#!/usr/bin/env rake
require "rake"
require "rubocop/rake_task"

branch = ENV["TRAVIS_BRANCH"] || "master"

formulas = Dir.glob("**/*.rb")
changed_formulas = `git diff --name-only #{branch}.. *.rb`.split("\n")

task :default do
  sh *%w(rake --tasks), verbose: false
end

desc "test any Homebrew formulas that have changed and validate them"
task check: ["test:changed", "validate:style"]

namespace :test do
  desc "test all formulas"
  task :all do
    sh *%W(brew audit --new-formula --strict --online),
       *formulas

    sh *%W(brew test),
       *formulas
  end

  desc "test any Homebrew formulas that have changed"
  task :changed  do
    next if changed_formulas.empty?
    sh *%W(brew test),
       *changed_formulas
  end
end

namespace :validate do
  desc "Audit formula styles"
  task :style do
    sh *%W(brew audit --online --strict --display-cop-names),
       *formulas
  end

  desc "Fix formula styles"
  task :fix do
    sh *%W(brew style --online --strict --display-cop-names --fix), 
       *formulas
  end
end
