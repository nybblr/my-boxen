# Public: Install FirefoxBeta to /Applications.
#
# Examples
#
#   include firefox::beta
class firefox::beta ($locale = 'en-US'){
  package { 'Firefox-Beta':
    source   => "http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/22.0b2/mac/${locale}/Firefox%2022.0b2.dmg",
    provider => 'appdmg'
  }
}
