# fnm
set PATH $HOME/.fnm $PATH
set -xg FNM_MULTISHELL_PATH $HOME/.fnm/current;
set -xg FNM_DIR $HOME/.fnm;
set -xg FNM_NODE_DIST_MIRROR https://nodejs.org/dist
fnm env --use-on-cd | source
