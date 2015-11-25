# Haciendo un proyecto con Bundler
#
# Para crear un proyecto con bundler, ejecutar el comando
#
#   bundle init
#
# en un directorio vacio. Esto creará en dicho directorio:
#
#   Gemfile
#
# Por defecto dicho Gemfile contiene la configuracion
#
#   # A sample Gemfile
#   source "https://rubygems.org"
#
#   # gem "rails"
#
# el cual establece como source a RubyGems y requiere
# (aunque está comentado) la gem de ruby on rails
#
# Despues de crear el archivo prueba.rb y editar el Gemfile
# al ejecutar 'ruby prueba.rb' se genera una exeption ya que
# se esta requiriendo una gem que no se tiene. En cambio, al
# ejecutar 'bundle exec ruby prueba.rb' lo que se está
# haciendo es intentar ejecutar el comando 'ruby prueba.rb'
# dentro del contexto del entorno definido por el Gemfile.
# La ejecucion tampoco es exitosa ya que todavia no se bajaron
# las gems requeridas en el Gemfile, ni estas existen localmente.
# Para descargar dichas gems (y si es necesario sus dependencias)
# y guardarlas el sistema usamos el comando
#
#   bundle install
#
# Ahora, ejecutando tanto 'ruby prueba.rb' o
# 'bundle exec ruby prueba.rb' se ejecuta normalmente.
# Esto se debe a que en el mismo archivo se hace el
# 'require' de la gem que se utiliza.
#
# Para 'prueba_2.rb' lo que hacemos es, en vez de requerir
# la gem 'colorputs', utilizamos 'Bundler.require', que
# intuitivamente se encarga de requerir todas las gems que
# se especifican en el Gemfile para el environment.
# A ejecutar 'bundle exec ruby prueba_2.rb' el script corre
# normalmente, pero a diferencia de 'prueba.rb' si queremos
# ejecutarlo solo usando 'ruby prueba_2.rb' da error ya que
# 'Bundler' como tal no está definido en nigun lado, ni se
# hicieron los 'require' necesarios
