
# Rails Virtual Development Environment on Vagrant

Configuration files to automatically set up a basic and customizable Vagrant box
with the required tools to develop Rails projects.


## Usage

0. Install in your computer the software listed the prerequisites section.
1. Clone the repository into your machine.
2. Tweak the provider and options in the `Vagrantfile`.
3. Run `vagrant up` and wait for the machine to be built, then `vagrant reload`.
4. When the machine is ready, run `vagrant ssh` and `cd /vagrant`.
5. You may now start a new Rails project with `rails new .` or adjust the Ruby
   and gems settings with RVM to match an existent code base.


## Prerequisites

* [Vagrant][0]
* [Virtualbox][1] and the extension pack.

If you experience notice that delays on the synchronization of shared folders,
a better option is to use [SSHF][2] or [NFS][3].


## Out of the Box Included Software

* **[Ubuntu Xenial][4]**: This Linux distribution is closer to the one used on
  the Heroku-16 stack.

* **Ruby 2.5.x (with [RVM][5])**: Programming language that supports the Rails
  framework. The Ruby Version Manager allows to easily use different Ruby
  versions and gems per project.

* **[Rails][11]**: And other gems to aid the development of web apps. (Current
  gem distributions).
  - RSpec
  - Cucumber
  - Mailcatcher
  - Pry-Byebug
  - PG
  - Redis-Rails
  - Webpacker
  - Bundler

* **[Yarn][12] and [Webpacker][13]**: For Rails projects with heavy use of
  JavaScript.

* **[Node.js][6]**: Server side JavaScript runtime. (Current stable version).

* **[Postgres][7]**: Advanced SQL database. (Current Xenial distribution).

* **[Redis][8]**: In-memory data structure store. (Current Xenial distribution).

* **[Heroku CLI][9]**: Creating and managing Heroku apps from the command line.

* **[Ngrok][15]**: Exposes local servers behind NATs and firewalls to the public
  internet over secure tunnels.

* **ZSH Shell (With [Oh-My-Zsh!][14])** Tools to improve the experience of
  working with the shell.

---
[0]: https://serverless.com/
[1]: https://www.virtualbox.org/wiki/Downloads
[2]: https://fedoramagazine.org/vagrant-sharing-folders-vagrant-sshfs/
[3]: https://www.vagrantup.com/docs/synced-folders/nfs.html
[4]: https://app.vagrantup.com/ubuntu/boxes/xenial64
[5]: https://rvm.io/
[6]: https://nodejs.org/en/
[7]: https://www.postgresql.org/
[8]: https://redis.io/
[9]: https://devcenter.heroku.com/articles/heroku-cli
[10]: https://www.heroku.com/
[11]: http://weblog.rubyonrails.org/2017/4/27/Rails-5-1-final/
[12]: https://yarnpkg.com/
[13]: https://github.com/rails/webpacker
[14]: http://ohmyz.sh/
[15]: https://ngrok.com/
