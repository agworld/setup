# Developer Laptop Configuration.

This is a relatively simple ansible setup heavily based on
https://github.com/zacs/setup as well as scripts from Jack and
sproutwrap chef recipes from Andrew.

This setup is intended to install most libraries and applications. After
running this a developer should install their own dotfiles and make
their own custom configurations.

### Set Up

Given you have a laptop you wish to setup you should:

* erase the hard drive
* install the latest OSX (tested on Yosemite)
* join the wireless network
* configure the Mac for user, not using Apple ID
* run software update
* install the latest XCode
* run `xcode-select --install` to install command line tools
* continue with the steps below

To install, all you need to do is run `bootstrap.sh` remotely. It will install some pre-requisites (gcc,
[Homebrew](http://brew.sh/), git, and [Ansible](http://docs.ansible.com/)) and will then clone this repo locally (by default it clones into `~/.setup`) and run the playbook:

    $ curl -fsSL https://raw.githubusercontent.com/agworld/setup/master/bootstrap.sh | sh

If you prefer not to run code remotely, you just need to clone the repo down wherever you would like, and run:

    $ ./bootstrap.sh

After installing the prerequisites this will run the `local` playbook
for the first time. If for some reason `bootstrap.sh` barfs, you can run the playbook manually via:

    $ ansible-playbook install.yml -K

The `-K` flag means that Ansible will prompt you for your sudo password
before it executes the playbook.

If it's your first time, go brew some coffee or tea because this will
take some time building packages.

### Manual Steps After Running Ansible

These will gradually become part of the automated ansible script.

#### Install Rvm & Ruby

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable
    rvm install ruby-2.1.3

#### Install Good Font That Doesn't Suck
    cd /tmp/
    curl https://codeload.github.com/adobe-fonts/source-code-pro/zip/1.017R > font.zip
    unzip font.zip
    open source-code-pro-1.017R/OTF/*
    cd -

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
