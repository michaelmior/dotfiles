export PATH="$HOME/.rvm/bin:$HOME/.rvm/rubies/default/bin:$PATH" # Add RVM to PATH for scripting
rvm() {
    unfunction rvm
    source "$HOME/.rvm/scripts/rvm"
    rvm "$@"
}

# settings from: https://github.com/jruby/jruby/wiki/Improving-startup-time
export JRUBY_OPTS="-J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify"
