# TODO: Get this script working automatically.
#       Currently it fails for a few reasons. RVM due to GPG signature verification. POW due to permissions.
echo "ERROR: This script doesn't work automatically yet!!! Run it manually for now on the laptop you're setting up."
exit 1

# Install Pow (c.f: http://pow.cx/):
curl get.pow.cx | sh
cd ~/.pow
ln -s ~/workspace/docsplit-server
ln -s ~/workspace/website
ln -s ~/workspace/website my.agworld
ln -s ~/workspace/reporting-service

# Install rvm (c.f: https://rvm.io/):
# c.f: https://stackoverflow.com/questions/15691977/why-start-a-shell-command-with-a-backslash
curl -sSL https://get.rvm.io | bash -s stable
# NOTE: For the next command to work, you'll need a new shell that has rvm loaded from $PATH!
# OR running the equivalent command to:
# source /Users/newdev/.rvm/scripts/rvm
# will work, where `newdev` need to be replaced with the user's home directory name.
rvm install 2.3.1
