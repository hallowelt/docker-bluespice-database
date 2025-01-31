#!/bin/sh

# The FARM edition creates a database for each wiki by default. The default prefix is "wiki_".
# We need to make sure the refular (non-root) user has access to all of them.

echo "Granting required permissions ..."

mariadb -u root -p"${MARIADB_ROOT_PASSWORD}" <<EOF
GRANT ALL PRIVILEGES ON \`wiki_%\`.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "Done."