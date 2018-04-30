# Developer Laptop Configuration.

This is a relatively simple ansible setup heavily based on
https://github.com/zacs/setup as well as scripts from Jack and
sproutwrap chef recipes from Andrew.

This setup is intended to install most libraries and applications. After
running this a developer should install their own dotfiles and make
their own custom configurations.

### Set Up

**NOTE** this README assumes you are running the setup scripts and Ansible playbooks on the system that is being installed.  The current preferred method is to run them from an existing system, which connects to the new system over SSH to perform the same steps.  See the documentation on the Confluence wiki page, [Laptop Setup](https://agworld.atlassian.net/wiki/spaces/DEV/pages/567804018/Laptop+Setup) for a more relavant guide.

Given you have a laptop you wish to setup you should:

* erase the hard drive
* install the latest OSX (tested on Sierra)
* join the wireless network
* configure the Mac for a user, not using Apple ID
* run software update
* continue with the steps below

To install, all you need to do is run `bootstrap.sh` remotely. It will install some pre-requisites (gcc,
[Homebrew](http://brew.sh/), git, and [Ansible](http://docs.ansible.com/)) and will then clone this repo locally (by default it clones into `~/.setup`) and run the playbook:

    $ curl -fsSL https://raw.githubusercontent.com/agworld/setup/master/bootstrap.sh | sh

If you prefer not to run code remotely, you just need to clone the repo down wherever you would like, and run:

    $ ./bootstrap.sh

After installing the prerequisites this will run the `local` playbook
for the first time. If for some reason `bootstrap.sh` barfs, you can run the playbook manually via:

    $ ansible-playbook setup-laptop.yml -K

The `-K` flag means that Ansible will prompt you for your sudo password
before it executes the playbook.

If it's your first time, go brew some coffee or tea because this will
take some time building packages.

### Manual Steps After Running Ansible

These will gradually become part of the automated ansible script.

### Run extra_default_user_setup.sh

This will setup RVM, install Ruby, do a few Homebrew steps.  This script is not actually production ready, therefore it's imperative you actually open it up and read through and run the commands manually.

Don't forget to actually click install to install the font.

#### Symlink ghostscript fonts
    ln -nfs /usr/local/share/ghostscript/fonts /usr/local/share/ghostscript/fontsx

#### Install prince
    brew install https://raw.github.com/staticfloat/homebrew-alt/master/non-free/princexml.rb

#### Install zeromq
    brew install zeromq22

### Credits

https://github.com/zacs/setup

Michael Griffin's [ansible-playbooks](https://github.com/MWGriffin/ansible-playbooks)
repository. That collection is far more complete.

[How I Fully Automated OS X Provisioning With
Ansible](http://il.luminat.us/blog/2014/04/19/how-i-fully-automated-os-x-with-ansible/).

### License

This work is in the public domain.
