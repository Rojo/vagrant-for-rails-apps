
# Rails-Heroku Development Environment on Vagrant

Configuration files to automatically set up a basic and customizable Vagrant box
with the required tools to develop Rails projects oriented to be deployed over
the [Heroku][10].

Therefore, the software versions installed try to match those supported on the
Heroku platform.


## Usage

0.- Install in your computer the software listed the prerequisites section.
1.- Clone the repository into your machine.
2.- Tweak the provider and options in the `Vagrantfile`.
3.- Run `vagrant up` and wait for the machine to be built.
4.- When the machine is ready, run `vagrant ssh` and `cd /vagrant`.
5.- ...


## Prerequisites

* [Vagrant][0]
* [Virtualbox][1] and the extension pack.

If you experience notice that delays on the synchronization of shared folders,
a better option is to use [SSHF][2] or [NFS][3].


## Included Software

* **[Ubuntu Xenial][4]**: This Linux distribution is closer to the one used on
  the Heroku-16 stack.

* **Ruby 2.4.x (with [RVM][5])**: Programming language that supports the Rails
  framework. The Ruby Version Manager allows to easily use different Ruby
  versions and gems per project.

* **[Rails 5.1.x][11]**: And other gems to aid the development of web apps.

* **[Node.js 8.2.x][6]**: Server side JavaScript runtime.

* **[Postgres 9.5][7]**: Advanced SQL database.

* **[Redis 3.0.x][8]**: In-memory data structure store.

* **[Heroku CLI][9]**: Tool for creating and managing Heroku apps from the
  the command line.

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
