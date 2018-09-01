#!/usr/bin/env rake
require "rake"
require "rubocop/rake_task"

branch = ENV["TRAVIS_BRANCH"] || "master"

formulas = Dir.glob("**/*.rb")
changed_formulas = `git diff --name-only #{branch}.. *.rb`.split("\n")

task :default do
  system "rake --tasks"
end

desc "test any Homebrew formulas that have changed and validate them"
task check: ["test:changed", "validate:style"]

namespace :test do
  desc "test all formulas"
  task :all do
    sh %(brew audit --strict --online #{formulas.join("\s")})
    sh %(brew test #{formulas.join("\s")})
  end

  desc "test any Homebrew formulas that have changed"
  task :changed  do
    next if changed_formulas.empty?
    sh %(brew test #{changed_formulas.join("\s")})
  end
end

namespace :validate do
  desc "Audit formula styles"
  task :style do
    sh %(brew audit --online --strict --display-cop-names #{formulas.join("\s")})
  end

  desc "Fix formula styles"
  task :fix do
    sh %(brew style --online --strict --display-cop-names --fix #{formulas.join("\s")})
  end
end
