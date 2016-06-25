#!/usr/bin/env python2.7
'''
Script to setup all of the symlinks
'''
import os
import sys

min_version = 2.7
version = float(sys.version[0:3])
if version < min_version:
    print('Error: Python version {} detected, use at least version {}', version, min_version)
    sys.exit(1)

HOME_DIR = os.path.expandvars('${HOME}')
CONF_DIR = HOME_DIR + '/.dotfiles/conf'

# TODO: Add checks if I move conf files dirs
conf_files = {
    CONF_DIR + '/profile':              HOME_DIR + '/.profile',
    CONF_DIR + '/inputrc':              HOME_DIR + '/.inputrc',
    CONF_DIR + '/tmux.conf':            HOME_DIR + '/.tmux.conf',
    CONF_DIR + '/sqliterc':             HOME_DIR + '/.sqliterc',
    CONF_DIR + '/jshintrc':             HOME_DIR + '/.jshintrc',
    CONF_DIR + '/pylintrc':             HOME_DIR + '/.pylintrc',
    CONF_DIR + '/pythonrc':             HOME_DIR + '/.pythonrc',
    CONF_DIR + '/jsbeautifyrc':         HOME_DIR + '/.jsbeautifyrc',
    CONF_DIR + '/tern-config':          HOME_DIR + '/.tern-config',
    CONF_DIR + '/ctags':                HOME_DIR + '/.ctags',
    CONF_DIR + '/agignore':             HOME_DIR + '/.agignore',
    CONF_DIR + '/gitconfig':            HOME_DIR + '/.gitconfig',
    CONF_DIR + '/global-gitignore':     HOME_DIR + '/.config/git/ignore',
    CONF_DIR + '/i3-config':            HOME_DIR + '/.i3/config',
    CONF_DIR + '/Xresources':           HOME_DIR + '/.Xresources',
    CONF_DIR + '/vimperatorrc':         HOME_DIR + '/.vimperatorrc',
    # File not in conf dir
    HOME_DIR + '/.dotfiles/zshrc':      HOME_DIR + '/.zshrc',
    HOME_DIR + '/.dotfiles/vimrc':      HOME_DIR + '/.config/nvim/init.vim',
    HOME_DIR + '/.dotfiles/vimrc':      HOME_DIR + '/.vimrc',
    HOME_DIR + '/.dotfiles/pre-commit': HOME_DIR + '/.dotfiles/.git/hooks/pre-commit'
}

def _removeLink(link, verbose=True):
    msg = ""
    try:
        msg = "Removing:" + link
        os.remove(link)
    except OSError as err:
        msg = 'Error during _removeLink: ' + str(err)
    finally:
        if verbose:
            print(msg)


def _createSymlink(src, dst, verbose = True):
    msg = ""
    try:
        msg = "[Success ] Creating symlink from: {} to: {}".format(src, dst)
        os.symlink(src, dst)
    except OSError as err:
        msg = 'Error during _createSymlink: ' + str(err)
    finally:
        if verbose:
            print(msg)

def main(verbose=True):
    for path, symlink in conf_files.items():
        _removeLink(symlink, verbose)
        if not os.path.isdir(os.path.dirname(symlink)):
            os.makedirs(os.path.dirname(symlink))
        _createSymlink(path, symlink, verbose)

if __name__ == '__main__':
    main()

