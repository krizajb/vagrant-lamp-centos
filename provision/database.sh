#!/bin/bash

DATABASE="foo"

mysql -u root << EOF
    CREATE DATABASE IF NOT EXISTS \`$DATABASE\`
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
EOF