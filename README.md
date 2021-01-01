# RepoCrate

A small utility to update / manage the applications that are installed from source.

## Usage

    repocrate update # To update all crates in the config

    repocrate install # Install all missing crates in the config

    repocrate sync # Install and update all crates

    repocrate help # Well help I guess :D

**Configuration**

    $HOME/.config/repocrate/conf.toml

    [nnn]
    crate = "~/dev/code/open_source/nnn"
    update_cmd = "git pull"
    build_cmd = "make O_NERD=1"
    post_build_cmd = "mv nnn /usr/local/bin/"
    install_command = "git clone https://github.com/jarun/nnn"

    [neofetch]
    crate = "~/dev/code/open_source/neofetch"
    update_cmd = "git pull"
    build_cmd = "make PREFIX=/usr/local install"
    install_command = "git clone https://github.com/dylanaraps/neofetch"


## Why ?

Like many other developers I use a lot of software that I build from source to change some smaller
stuff that I don't like. (Remove pane border in tmux etc.).
Thus my open_source folder(where I have all my repos) gets crowded from time to time.

So rather than going into each directory and lookup how to build that repo, I just add
an entry to the **repocrate** config and can sleep in peace.

## TODO

[TODO-List Issue](https://github.com/Liberatys/repocrate/issues/1)
