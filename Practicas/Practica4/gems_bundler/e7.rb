# -------------------------------------------------------
# 1 - Que finalidad tiene el archivo Gemfile?
# -------------------------------------------------------
# En lineas generales un gemfile define las dependencias
# de un programa ruby en terminos de gems requeridas,
# "librerias". Estos archivos se pueden definir con una
# sintaxis particular que flexibiliza la definicion de
# estas dependencias y da herramientas para definir otras
# cosas como fuentes de descarga, algunos aspectos de SSL,
# ambientes de ejecucion (:default, :development, ...)

# -------------------------------------------------------
# 2 - Utilidad de directiva 'source'? Cuantas puede haber?
# -------------------------------------------------------
# Dentro de un Gemfile, la directiva 'source' sirve para
# determinar de donde se requeriran las gemas. Por defecto
# está seteada 'https://rubygems.org', la url de RubyGems,
# pero podrian utilizarse otros repositorios de gems.
# Pueden listarse varias directivas 'source', pero no se
# recomienda.
# NOTA: la directiva global 'source' no es la unica forma
# de especificar fuentes para descargar

# -------------------------------------------------------
# 3 - Sobre el ejercicio 6 y la gem 'colorputs'
# -------------------------------------------------------
# - Que version se instaló?
#   Al no especificarse la versión deseada ni niguna
#   restriccion, se descargó la ultima versión publicada
#   en RubyGems
#
# - Si mañana se publicase la version 7.3.2, esta se
#   instalaría en el proyecto? Porqué?
#   Si se ejecuta un 'bundle install' nuevamente, la gem
#   se actualizaria, ya que no se especificaron
#   restricciones para la version de la gem
#
# - Como podrias limitar esto para que se instalen las
#   releases de la gema que no cambie la version mayor?
#   Agregandole una restrccion a la directiva 'gem':
#
#     gem 'colorputs', '~>7.0'
#
#   Esta restriccion en particular significa que se
#   aceptan versiones >= 7.0.0 y < 8.0.0, efectivamente
#   restringiendo un cambio mayor en la version

# -------------------------------------------------------
# 6 - Que diferencias hay entre 'install' y 'update'?
# -------------------------------------------------------
# 'bundle install', cuando se ejecuta por primera vez,
# revisa el archivo Gemfile, resuelve dependencias y
# descarga todas las gems requeridas, con las cuales
# arma un Gemfile.lock, el cual describe una "snapshot"
# del set de gems y sus versiones. Al ejecutarse una
# segunda vez, hay 2 posibilidades, si se modificó el
# Gemfile vuelve a procesarlo como en una primera
# instancia. Si no se modificó el Gemfile, descarga las
# dependencias tal cual estan descriptas en el
# Gemfile.lock

# 'bundle update' se utiliza para actualizar la/s gems
# utilizadas, ignorando y regenerando lo especificado
# en el Gemfile.lock y basandose en las restricciones
# definidas en el Gemfile
# En general, 'bundle update' se deberia utilizar para
# explicitamente actualizar la version de una/s gem


# -------------------------------------------------------
# 4,5,7 - Ver e6.rb
# -------------------------------------------------------
