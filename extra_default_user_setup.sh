# Create a default workspace
mkdir ~/workspace

# Install rvm (c.f: https://rvm.io/):
\curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.3.1

# Install Pow (c.f: http://pow.cx/):
curl get.pow.cx | sh
cd ~/.pow
ln -s ~/workspace/docsplit-server
ln -s ~/workspace/website
ln -s ~/workspace/website my.agworld
ln -s ~/workspace/reporting-service

# Install ImageMagick
brew unlink libtool
brew uninstall ghostscript imagemagick libtool
brew install libtool --universal
brew link libtool
brew install ghostscript imagemagick
rvm use 2.3.1@global
# If you have rmagick installed already either in global or docsplit gemset, make sure to uninstall it now:
gem install rmagick
rvm use default


# Install Postgres
# TODO: Figure out best way to do this.
# Requirements:
# - Should be the same version as production (i.e. whatever the upcoming version is; 9.6 or 9.5).
# - Can type `psql`, and it straight away brings you into the postgres console with the default database (usually the user's name, e.g. swrathal)
# - Can type `pg_ctl status` and get the status of the running postgres server
# e.g:
~ $ psql
psql (9.2.4)
Type "help" for help.
swrathal=# \q
~ $ pg_ctl status
pg_ctl: server is running (PID: 8292)
/usr/local/Cellar/postgresql/9.2.4/bin/postgres "-D" "/usr/local/var/postgres" "-r" "/usr/local/var/postgres/server.log"
