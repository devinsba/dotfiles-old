#@IgnoreInspection BashAddShebang

# INSTALLER
INSTALLERS=()

function register_installer() {
    INSTALLERS+=($1)
}

function execute_installers() {
    for func in "${INSTALLERS[@]}"
    do
        $func
    done
}

# UPDATER
UPDATERS=()

function register_updater() {
    UPDATERS+=($1)
}

function execute_updaters() {
    for func in "${UPDATERS[@]}"
    do
        $func
    done
}

# POST INIT
POST_INITS=()

function register_postinit() {
    POST_INITS+=($1)
}

function execute_postinits() {
    echo "Executing post init steps"
    for func in "${POST_INITS[@]}"
    do
        $func
    done
}