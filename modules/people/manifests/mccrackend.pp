class people::mccrackend {

	boxen::osx_defaults { 'Safari: enable develop menu':
		ensure => present,
		domain => 'com.apple.Safari',
		key => 'IncludeDevelopMenu',
		type => 'bool',
		value => true,
		user => $::boxen_user
	}

	$home_directory = '/Users/Dan'

	# Applications
	include quicksilver
	include evernote
	include intellij
	include keepassx
	include atom

	# OSX Settings
	include osx::disable_app_quarantine
 	include osx::dock::autohide
 	include osx::finder::show_hidden_files
 	include osx::finder::unhide_library
 	include osx::global::disable_autocorrect
 	include osx::global::enable_keyboard_control_access
 	include osx::no_network_dsstores
	include osx::global::tap_to_click
	include osx::universal_access::ctrl_mod_zoom

	class { 'osx::global::key_repeat_delay':
		delay => 15
	}

	class { 'osx::global::key_repeat_rate':
     		rate => 1
   	}

 	# Git
  	git::config::global { 'user.name': value => 'Dan McCracken' }
  	git::config::global { 'user.email': value => 'mccrackend@gmail.com' }

  	git::config::global { 'core.editor': value => 'vi' }

    	git::config::global { 'color.diff': value => 'auto' }
	git::config::global { 'color.status': value => 'auto' }
    	git::config::global { 'color.branch': value => 'auto' }
    	git::config::global { 'color.interactive': value => 'auto' }
    	git::config::global { 'color.ui': value => 'true' }

    	git::config::global { 'alias.st': value => 'status -s' }
    	git::config::global { 'alias.co': value => 'checkout' }
    	git::config::global { 'alias.br': value => 'branch -v' }
    	git::config::global { 'alias.rhh': value => 'reset --hard' }
    	git::config::global { 'alias.llog': value => 'log --date=local' }
    	git::config::global { 'alias.ls': value => 'log -10 --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(red)<%an>%Creset\' --abbrev-commit --date=local' }
    	git::config::global { 'alias.lg': value => 'log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(red)<%an>%Creset\' --abbrev-commit --date=local' }
}
