require boxen::environment
require homebrew
# require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ]
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include git
  include homebrew
  include xquartz

  include zsh

  include osx::dock::autohide
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::finder::show_mounted_servers_on_desktop
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_removable_media_on_desktop
  include osx::no_network_dsstores

  include keyremap4macbook
  include keyremap4macbook::login_item

  # set key repeat timeouts
  keyremap4macbook::set{ 'repeat.consumer_initial_wait':
    value => '200'
  }
  keyremap4macbook::set{ 'repeat.consumer_wait':
    value => '50'
  }
  keyremap4macbook::set{ 'repeat.initial_wait':
    value => '100'
  }
  keyremap4macbook::set{ 'repeat.wait':
    value => '40'
  }

  include pckeyboardhack
  include pckeyboardhack::login_item

  # map capslock to escape
  pckeyboardhack::bind { 'keyboard bindings':
    mappings => { 'capslock' => 53, 'escape' => 57 }
  }

  include virtualbox
  include iterm2::dev
  include textmate::textmate2::release
  include dropbox
  include chrome
  include firefox
  include clipmenu
  include handbrake
  include spectacle
  include vlc

  # dotfiles
  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${home}/.dotfiles"

  repository { $dotfiles_dir:
    source => "${::github_login}/dotfiles"
  }

  exec { "install dotfiles":
    cwd      => $dotfiles_dir,
    command  => "./scripts/install.sh",
    provider => shell,
    creates  => "${home}/.zshrc",
    require  => Repository[$dotfiles_dir]
  }
}
