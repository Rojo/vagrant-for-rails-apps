
# Entorno virtual de desarollo para Rails en Vagrant

[English][en] |
------------- |

Archivos de configuración para construir automaticamente una maquina virtual flexible con las herramientas básicas para desarrollar proyectos con el framework Rails.


## Forma de uso

0. Instala en tu computadora el software listado en la sección «Prerequisitos».
1. Clona el repositorio en tu computadora.
2. Ajusta el parametro `provider` y otras opciones del `Vagrantfile`.
3. Ejecuta `vagrant up` y espera a que la maquina virtual se construya. Al terminar, ejecuta `vagrant reload`.
4. Ya con la maquina virtual lista, conectate a ella con `vagrant ssh` y muevente al directorio sincronizado con `cd /vagrant`.
5. Ahora puedes crear un projecto de nuevo de Rails con `rails new .` o ajustar la configuracion de Ruby y las gemas con RVM para ser compatibles con un proyecto existente.


## Prerequisitos

* [Vagrant][0]
* [Virtualbox][1] y el paquete de extensión.

Si experimentas retrasos en la sincronización de archivos con `virtualbox` como `type`, una mejor opcion es usar [SSHFS][2] o [NFS][3], aunque usualmente funciona bien.


## Software incluido

* **[Ubuntu Xenial][4]**: Ésta distribución de Linux es la más cercana a la utilizada en el stack Heroku-16.

* **Ruby 2.5.x (con [RVM][5])**: Lenguaje de programación que soporta al framework Rails. El administrador de versiones de Ruby permite usar diferentes versiones y grupos de gemas por proyecto.

* **[Rails][11]**: Y otras gemas para ayudar al desarrollo de aplicaciones web. (Son las versiones estables más recientes):
  - RSpec
  - Cucumber
  - Mailcatcher
  - Pry-Byebug
  - PG
  - Redis-Rails
  - Webpacker
  - Bundler

* **[Yarn][12] and [Webpacker][13]**: Para proyectos de Rails con mucho uso de JavaScript.

* **[Node.js][6]**: Motor de ejecición para JavaScript del lado del servidor. (Versión estable más reciente).

* **[Postgres][7]**: Manejador avanzado de bases de datos relacionales. (Distribución de Xenial).

* **[Redis][8]**: Almacenamiento de estructura de datos en memoria. (Distribución de Xenial).

* **[Heroku CLI][9]**: Crea y maneja applicaciones en Heroku desde la terminal.

* **[Ngrok][15]**: Crea tuneles temporales seguros para permitir el acceso a tu aplicación desde Internet.

* **ZSH Shell (With [Oh-My-Zsh!][14])** Herramientas para mejorar la experiencia al trabajar con la terminal.

---
[0]: https://www.vagrantup.com/downloads.html
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
[en]: ../README.md
