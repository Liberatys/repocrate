# RepoCrate

A small utility to update the applications that are installed from source.

## Usage (Current idea)

    repocrate -f config/file.toml
    # load $HOME/.config/repocrate/config.toml by default
    [config-internal] // due to lack of better name that will not be used :D 
    show_progress_bar = true //disable if you run in the background
    update_threads = 1 // number of threads to use for updating packages / -1 for I don't care

    [application-name]
    crate = "path/to/repo"
    branch = "THE BRANCH TO BUILD FROM"
    update_cmd = "git pull" // use something different for non git repo ^^
    build_cmd = "make install"
    post_build_cmd = "mv binary /Users/locale/*" // mabye the repo does not move the binary
