#!/usr/bin/env rake
# frozen_string_literal: true

require "rake"

branch = ENV["TRAVIS_BRANCH"] || "master"

formulas = Dir.glob("**/*.rb")
changed_formulas = `git diff --diff-filter=AM --name-only #{branch}.. *.rb`.split("\n")

task :default do
  sh "rake", "--tasks", verbose: false
end

desc "test any Homebrew formulas that have changed and validate them"
task check: ["test:changed", "validate:style"]

namespace :test do
  desc "test all formulas"
  task :all do
    sh "brew", "audit", "--new-formula", "--strict", "--online",
       *formulas

    sh "brew", "test",
       *formulas
  end

  desc "test any Homebrew formulas that have changed"
  task :changed  do
    next if changed_formulas.empty?
    sh "brew", "test",
       *changed_formulas
  end
end

namespace :validate do
  desc "Audit formula styles"
  task :style do
    sh "brew", "audit", "--online", "--strict", "--display-cop-names",
       *formulas
  end

  desc "Fix formula styles"
  task :fix do
    sh "brew", "style", "--online", "--strict", "--display-cop-names", "--fix",
       *formulas
  end
end
