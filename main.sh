#!/bin/bash -i

source "$(dirname $0)"/menu/main_menu.sh


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi