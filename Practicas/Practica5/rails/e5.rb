# ----------------------------------------------------------------
# Rails - Configurations
# ----------------------------------------------------------------
# 1 - De que forma podes especificar parametros de configuracion
#     del framework en una app Rails?
#     Rails permite configurar la aplicacion y los modulos que la
#     componen a travez de metodos que son invocados en un objeto
#     de la clase (o subclase) Rails::Railtie a travez del metodo
#     'config.config_name'. Por ejemplo, para configurar la
#     localizacion por defecto de la aplicacion, deberia usarse:
#
        Rails.application.config.i18n.default_locale = :es
#
#     Esto configuraria la localizacion de la app en español.
#     Particularmente, estando en config/application.rb o algun
#     archivo de enviroments/*.rb se puede omitir el prefijo
#     Rails.application, por lo que quedaria:
#
        config.i18n.default_locale = :es
#
#
# 2 - Cuales son los archivos principales?
#     Rails provee varios puntos de configuracion:
#     - config/application.rb
#       Archivo de configuracion principal
#
#     - config/environments/*.rb
#       Archivos de configuracion de los environments, tienen
#       presedencia sobre las configuraciones de application.rb
#
#     - config/initializers/*.rb
#       Los initializers son todos los archivos de extension
#       .rb dentro de la carpeta config/initializers, o de sus
#       sub-directorios. Estos archivos pueden contener codigo,
#       usualmente de configuracion, el cual se ejecutará una
#       vez cargado el framework y sus dependencias.
#
#     - Hooks
#       Rails tambien define hooks para ejecutar codigo
#       antes y/o despues de ciertos eventos, tales como:
#       - config.before_configuration
#       - config.before_initialize
#       - config.to_prepare
#       - config.after_initialize
#       Estos hooks puede utilizarse definiendo un bloque
#       dentro de la clase Application en el archivo
#       application.rb
#
          module YourApp
            class Application < Rails::Application
              config.before_initialize do
                # initialization code goes here
              end
            end
          end
#
#
# 3 - Modificar el locale de la aplicacion
#     Dentro de 'application.rb' viene predeterminadamente
#     una linea que ejemplifica como modificar la localizacion
#     de la aplicacion, particularmente a :de (deustch?). Para
#     configurarla al español usariamos la linea:
#
        config.i18n.locale = :es
#
#     O para configurar la localizacion por defecto:
#
        config.i18n.default_locale = :es
#
#     Pero solo haciendo esto no alcanza, ya que por defecto la
#     unica localizacion existente por defecto es :en. Para
#     utilizar la localizacion :es debemos definir un archivo
#     es.yml o es.rb en el directorio config/locales, el cual
#     debe contener la descripcion de la localizacion. Existe
#     por defecto en.yml, el cual describe de forma jerarquica
#     la estructura, siendo primero :en (el lenguaje) y luego
#     los tags junto con su representacion
#
#       Default en.yml
          en:
            hello: "Hello World"
#
#       Custom es.yml
          es:
            hello: "Holis Gente"

# 4 - Configurar la zona horaria para que sea la de Argentina
#     Dentro de 'application.rb' viene predeterminadamente
#     una linea que ejemplifica como modificar el timezone
#     de la aplicacion, particularmente a Centro USA. Para
#     configurarla en la timezone de argentina usariamos:
#
        config.i18n.locale = "Buenos Aires"
#
#     Cabe destacar este hash de mapeo entre strings y
#     timezones:
        {
          "International Date Line West" => "Pacific/Midway",
          "Midway Island" => "Pacific/Midway",
          "American Samoa" => "Pacific/Pago_Pago",
          "Hawaii" => "Pacific/Honolulu",
          "Alaska" => "America/Juneau",
          "Pacific Time (US & Canada)" => "America/Los_Angeles",
          "Tijuana" => "America/Tijuana",
          "Mountain Time (US & Canada)" => "America/Denver",
          "Arizona" => "America/Phoenix",
          "Chihuahua" => "America/Chihuahua",
          "Mazatlan" => "America/Mazatlan",
          "Central Time (US & Canada)" => "America/Chicago",
          "Saskatchewan" => "America/Regina",
          "Guadalajara" => "America/Mexico_City",
          "Mexico City" => "America/Mexico_City",
          "Monterrey" => "America/Monterrey",
          "Central America" => "America/Guatemala",
          "Eastern Time (US & Canada)" => "America/New_York",
          "Indiana (East)" => "America/Indiana/Indianapolis",
          "Bogota" => "America/Bogota",
          "Lima" => "America/Lima",
          "Quito" => "America/Lima",
          "Atlantic Time (Canada)" => "America/Halifax",
          "Caracas" => "America/Caracas",
          "La Paz" => "America/La_Paz",
          "Santiago" => "America/Santiago",
          "Newfoundland" => "America/St_Johns",
          "Brasilia" => "America/Sao_Paulo",
          "Buenos Aires" => "America/Argentina/Buenos_Aires",
          "Montevideo" => "America/Montevideo",
          "Georgetown" => "America/Guyana",
          "Greenland" => "America/Godthab",
          "Mid-Atlantic" => "Atlantic/South_Georgia",
          "Azores" => "Atlantic/Azores",
          "Cape Verde Is." => "Atlantic/Cape_Verde",
          "Dublin" => "Europe/Dublin",
          "Edinburgh" => "Europe/London",
          "Lisbon" => "Europe/Lisbon",
          "London" => "Europe/London",
          "Casablanca" => "Africa/Casablanca",
          "Monrovia" => "Africa/Monrovia",
          "UTC" => "Etc/UTC",
          "Belgrade" => "Europe/Belgrade",
          "Bratislava" => "Europe/Bratislava",
          "Budapest" => "Europe/Budapest",
          "Ljubljana" => "Europe/Ljubljana",
          "Prague" => "Europe/Prague",
          "Sarajevo" => "Europe/Sarajevo",
          "Skopje" => "Europe/Skopje",
          "Warsaw" => "Europe/Warsaw",
          "Zagreb" => "Europe/Zagreb",
          "Brussels" => "Europe/Brussels",
          "Copenhagen" => "Europe/Copenhagen",
          "Madrid" => "Europe/Madrid",
          "Paris" => "Europe/Paris",
          "Amsterdam" => "Europe/Amsterdam",
          "Berlin" => "Europe/Berlin",
          "Bern" => "Europe/Berlin",
          "Rome" => "Europe/Rome",
          "Stockholm" => "Europe/Stockholm",
          "Vienna" => "Europe/Vienna",
          "West Central Africa" => "Africa/Algiers",
          "Bucharest" => "Europe/Bucharest",
          "Cairo" => "Africa/Cairo",
          "Helsinki" => "Europe/Helsinki",
          "Kyiv" => "Europe/Kiev",
          "Riga" => "Europe/Riga",
          "Sofia" => "Europe/Sofia",
          "Tallinn" => "Europe/Tallinn",
          "Vilnius" => "Europe/Vilnius",
          "Athens" => "Europe/Athens",
          "Istanbul" => "Europe/Istanbul",
          "Minsk" => "Europe/Minsk",
          "Jerusalem" => "Asia/Jerusalem",
          "Harare" => "Africa/Harare",
          "Pretoria" => "Africa/Johannesburg",
          "Kaliningrad" => "Europe/Kaliningrad",
          "Moscow" => "Europe/Moscow",
          "St. Petersburg" => "Europe/Moscow",
          "Volgograd" => "Europe/Volgograd",
          "Samara" => "Europe/Samara",
          "Kuwait" => "Asia/Kuwait",
          "Riyadh" => "Asia/Riyadh",
          "Nairobi" => "Africa/Nairobi",
          "Baghdad" => "Asia/Baghdad",
          "Tehran" => "Asia/Tehran",
          "Abu Dhabi" => "Asia/Muscat",
          "Muscat" => "Asia/Muscat",
          "Baku" => "Asia/Baku",
          "Tbilisi" => "Asia/Tbilisi",
          "Yerevan" => "Asia/Yerevan",
          "Kabul" => "Asia/Kabul",
          "Ekaterinburg" => "Asia/Yekaterinburg",
          "Islamabad" => "Asia/Karachi",
          "Karachi" => "Asia/Karachi",
          "Tashkent" => "Asia/Tashkent",
          "Chennai" => "Asia/Kolkata",
          "Kolkata" => "Asia/Kolkata",
          "Mumbai" => "Asia/Kolkata",
          "New Delhi" => "Asia/Kolkata",
          "Kathmandu" => "Asia/Kathmandu",
          "Astana" => "Asia/Dhaka",
          "Dhaka" => "Asia/Dhaka",
          "Sri Jayawardenepura" => "Asia/Colombo",
          "Almaty" => "Asia/Almaty",
          "Novosibirsk" => "Asia/Novosibirsk",
          "Rangoon" => "Asia/Rangoon",
          "Bangkok" => "Asia/Bangkok",
          "Hanoi" => "Asia/Bangkok",
          "Jakarta" => "Asia/Jakarta",
          "Krasnoyarsk" => "Asia/Krasnoyarsk",
          "Beijing" => "Asia/Shanghai",
          "Chongqing" => "Asia/Chongqing",
          "Hong Kong" => "Asia/Hong_Kong",
          "Urumqi" => "Asia/Urumqi",
          "Kuala Lumpur" => "Asia/Kuala_Lumpur",
          "Singapore" => "Asia/Singapore",
          "Taipei" => "Asia/Taipei",
          "Perth" => "Australia/Perth",
          "Irkutsk" => "Asia/Irkutsk",
          "Ulaanbaatar" => "Asia/Ulaanbaatar",
          "Seoul" => "Asia/Seoul",
          "Osaka" => "Asia/Tokyo",
          "Sapporo" => "Asia/Tokyo",
          "Tokyo" => "Asia/Tokyo",
          "Yakutsk" => "Asia/Yakutsk",
          "Darwin" => "Australia/Darwin",
          "Adelaide" => "Australia/Adelaide",
          "Canberra" => "Australia/Melbourne",
          "Melbourne" => "Australia/Melbourne",
          "Sydney" => "Australia/Sydney",
          "Brisbane" => "Australia/Brisbane",
          "Hobart" => "Australia/Hobart",
          "Vladivostok" => "Asia/Vladivostok",
          "Guam" => "Pacific/Guam",
          "Port Moresby" => "Pacific/Port_Moresby",
          "Magadan" => "Asia/Magadan",
          "Srednekolymsk" => "Asia/Srednekolymsk",
          "Solomon Is." => "Pacific/Guadalcanal",
          "New Caledonia" => "Pacific/Noumea",
          "Fiji" => "Pacific/Fiji",
          "Kamchatka" => "Asia/Kamchatka",
          "Marshall Is." => "Pacific/Majuro",
          "Auckland" => "Pacific/Auckland",
          "Wellington" => "Pacific/Auckland",
          "Nuku'alofa" => "Pacific/Tongatapu",
          "Tokelau Is." => "Pacific/Fakaofo",
          "Chatham Is." => "Pacific/Chatham",
          "Samoa" => "Pacific/Apia",
        }
