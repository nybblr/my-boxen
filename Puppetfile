# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.1"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

# github "autoconf",   "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "osx",        "1.5.0"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
# github "nginx",      "1.4.2"
# github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0" # stipulate sources
# github "ruby",       "6.3.0"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0" # sudo file
github "xquartz",    "1.1.0" # X11 windowing system

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "virtualbox",       "1.0.5"
github "iterm2",           "1.0.3"
github "textmate",         "1.1.0"
github "dropbox",          "1.1.1"
# github "chrome",           "1.1.1"
github "firefox",          "1.1.1"

github "property_list_key", "0.1.0"
github "pckeyboardhack",    "1.0.5", :repo => "smh/puppet-pckeyboardhack"
github "keyremap4macbook",  "1.0.4"
github "clipmenu",          "1.0.0"
github "handbrake",         "1.0.1"
github "spectacle",         "1.0.0"
github "vlc",               "1.0.3"
