#!/usr/bin/env bash

# Region - Constants
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
PROJECT_DIR="$BASE_DIR/.."

# Region - Color
CONFIG_COLOR_BOLD=$(tput bold)
CONFIG_COLOR_RED=`tput setaf 1`
CONFIG_COLOR_GREEN=`tput setaf 2`
CONFIG_COLOR_GREEN_LIGHT="$CONFIG_COLOR_BOLD$CONFIG_COLOR_GREEN"
CONFIG_COLOR_CYAN=`tput setaf 6`
CONFIG_COLOR_GRAY=`tput setaf 7`
CONFIG_COLOR_FAWN=$(tput setaf 3); CONFIG_COLOR_BEIGE="$CONFIG_COLOR_FAWN"
CONFIG_COLOR_YELLOW="$CONFIG_COLOR_BOLD$CONFIG_COLOR_FAWN"
CONFIG_COLOR_PURPLE=$(tput setaf 5);
CONFIG_COLOR_PINK="$CONFIG_COLOR_BOLD$CONFIG_COLOR_PURPLE"
CONFIG_COLOR_DARKCYAN=$(tput setaf 6)
CONFIG_COLOR_CYAN="$CONFIG_COLOR_BOLD$CONFIG_COLOR_DARKCYAN"
CONFIG_COLOR_RESET=`tput sgr0`
# EndRegion - Color
# EndRegion - Constants

# Region - Methods
log_d() {
    printf "${CONFIG_COLOR_CYAN}[Gradle][CI]${CONFIG_COLOR_RESET} $1\n"
}
log_d_tag() {
    printf "${CONFIG_COLOR_CYAN}[Gradle][CI]${CONFIG_COLOR_RESET}$1\n"
}
log_e() {
    printf "${CONFIG_COLOR_RED}[Gradle][CI][Error]${CONFIG_COLOR_RESET} $1\n"
}
log_e_tag() {
    printf "${CONFIG_COLOR_RED}[Gradle][CI][Error]${CONFIG_COLOR_RESET}$1\n"
}
log_jump() {
    printf "\n"
}
log_delimiter() {
    printf "${CONFIG_COLOR_RED}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${CONFIG_COLOR_RESET}\n"
}
# EndRegion - Methods

gradle_task() {
    module_name=$1
    task_name=$2

    log_d_tag "[${module_name}] ${task_name}"
    ./gradlew ${module_name}:${task_name}
    exit_status=$?
    if [ ${exit_status} -eq 1 ]; then
        log_e_tag "[${module_name}] ${task_name} failed"
        log_e_tag "[${module_name}] ${task_name} failed"
        exit ${exit_status}
    fi
}

pushd "$PROJECT_DIR"

    gradle_task "common_native" "build"

    log_jump
    log_delimiter
    log_delimiter
    log_jump
    log_jump

    ./common_native/build/konan/bin/macos_x64/common_native_main.kexe

    log_jump
    log_jump
    log_delimiter
    log_delimiter
    log_jump

popd
