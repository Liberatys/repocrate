# RepoCrate

A small utility to update the applications that are installed from source.

## Usage

    repocrate update

**Configuration**

    $HOME/.config/repocrate/conf.toml

    [nnn]

    crate = "~/dev/code/open_source/nnn"
    update_cmd = "git pull"
    build_cmd = "make O_NERD=1"
    post_build_cmd = "mv nnn /usr/local/bin/"

    [git]
    ...


## Why ?

Like many other developers I use a lot of software that I build from source to change some smaller
stuff that I don't like. (Remove pane border in tmux etc.).
Thus my open_source folder(where I have all my repos) gets crowded from time to time.

So rather than going into each directory and lookup how to build that repo, I just add
an entry to the **repocrate** config and can sleep in peacy.

## TODO

- [ ] Add a progress bar
- [ ] More feedback to the user on the state of updating packages
- [ ] Test for more applications that just git repositories
- [ ] Use more than one thread to build stuff
- [ ] Validation of the configuration
    - [ ] Duplicate packages ?
    - [ ] Invalid path
    - [ ] Invalid input
- [ ] Push to https://rubygems.org
- [ ] Think about adding an **install** command with configurations for some of the most used projects

