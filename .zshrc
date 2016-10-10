# Path to your oh-my-zsh installation.
export ZSH=/Users/taylos90/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sammy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gradle)

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/taylos90/development/dex2jar-0.0.9.15:/Users/taylos90/development/android-sdk-macosx/platform-tools:/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh
# alias git="hub"

# export http_proxy=http://www-cache.reith.bbc.co.uk:80
# export https_proxy=$http_proxy
# export ALL_PROXY=$http_proxy
export ANDROID_HOME=~/Library/Android/sdk
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_KEYSTORE_PATH=~/development/android-signing-keys

networkLocation=$(networksetup -getcurrentlocation)


# ON NETWORK SETTINGS - Always run
if [[ "$networkLocation" = "BBC On Network" ]]
then
   echo "Adding Reith proxy env variables"
   export http_proxy=http://www-cache.reith.bbc.co.uk:80
   export rvm_proxy=http://www-cache.reith.bbc.co.uk:80
   export https_proxy=$http_proxy
   export all_proxy=$http_proxy
   export https_proxy=$http_proxy
   git config --global http.proxy $http_proxy
   git config --global core.gitproxy $http_proxy
   export no_proxy="*.bbc.co.uk,localhost,127.0.0.1" 
   if [ -f ~/.ssh/_config ]; then
        mv ~/.ssh/_config ~/.ssh/config
   fi;
fi

# OFF NETWORK SETTINGS - Always run
if [[ "$networkLocation" = "BBC Off Network" ]]
then
   echo "Removing Reith proxy env variables"
   unset http_proxy
   unset https_proxy
   unset all_proxy
   unset https_proxy
   unset rvm_proxy
   git config --global --unset http.proxy
   git config --global --unset core.gitproxy
   if [ -f ~/.ssh/config ]; then
	mv ~/.ssh/config ~/.ssh/_config
   fi;
fi

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
