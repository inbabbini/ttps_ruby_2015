# ---------------------------------------------------------------
# Extensiones que ActiveSupport agrega a ciertas clases
# ---------------------------------------------------------------
# En general, ActiveSupport augmenta las diferentes clases pre
# existentes de Ruby (core) agregandole metodos con el fin de
# facilitar su uso y tener una sintaxis mas descriptiva.
# Algunos ejemplos:
#
# String
#   Safety
#   - #html_safe? -> boolean : retorna si un string es seguro
#     de insertar en HTML (escapado o no). Por default false
#   - #html_safe -> "str" : retorna un str seguro de insertar,
#     no lo escapa ni nada, solo lo "setea" como seguros
#   - #+, #<<, #concat -> appendea el string pasado, si es
#     inseguro para HTML lo escapa/formatea
#
#   Transformation
#   Cualquier metodo que pueda modificar un string lo vuelve
#   inseguro
#   - #remove(p) -> "str" : retorna un string sin las ocurrencias
#     del patron p pasado
#   - #squish -> "str" : retorna el string trimmeado y con los
#     whitespaces achicados
#   - #truncate(n) -> "str" : retorna el string truncado en la
#     posicion n
#   - #truncate_words(n) -> "str" : retorna el string truncado en
#     la palabra n
#   - #inquiry -> inquiryObj : retorna un objeto StringInquirer
#   - #starts_with?(l) -> boolean : true si el string comienza
#     con l
#   - #strip_heredoc -> heredoc : stripea la identacion del
#     heredoc
#   - #ident(n) -> "identedstr" : identa las lineas del string
#     con n espacios
#
#   Accessing
#   - #at(p) -> 'str' : retorna el caracter en la posicion p
#   - #from(p) -> 'substr' : retorna eºl string desde la pos p
#   - #to(p) -> 'subsr' : retorna el string hasta la pos p
#   - #first(n) -> sbstr : retorna el substr de los primeros
#     n caracteres
#   - #last(n) -> substr : retorna el substr de los ultimos n
#
#   Inflections
#   - #pluralize(c) -> 'plural' : retorna la palabra en plural
#   - #singularize -> 'singular' : retorna la palabra en singular
#   - #camelize -> 'CamelCased' : retorna el string en camelcase
#   - #underscore -> 'paths/underscored' : retorna las palabras en lower
#   - #titleize -> 'Titled Str' : retorna las palabras capitalizadas
#   - #dasherize -> 'dashed-str' : reemplaza '_' por '-'
#   - #demodularize -> 'Demodularzed' : desmoduraliza (5.11.7)
#   - #desconstantize -> 'containerized' : modulariza (5.11.8)
#   - #parameterize -> 'normalized-str' : normaliza string, (5.11.9)
#   - #tablerize -> 'tablericed_strs' : normaliza a nombre de DB table
#   - #classify -> 'TablericedStr' : normaliza a nombre de modelo
#   - #constantize -> Constante : resuelve "str" a una constante
#   - #humanize -> 'Humaniced str.' : usa reglas para hacer 'str' legible
#   - #foreing_key -> 'str_id' : formatea a FK, underscore y lowercase
#
#   Conversions
#   - #to_date -> Parced Date : retorna DT[Dia Mes Año]
#   - #to_time -> Parced Time : retorna DT[Mes Dia H:M:S UTC YEAR]
#   - #to_datetime -> Parced DT : retorna DT[Dia Mes Año H:M:S +TMZN]
#
#
# Array:
#   Accessing
#   - #to(int) -> [] : retorna sub array [0..int]
#   - #from(int) -> [] : retorna sub array [int..N]
#   - #second -> e : retorna segundo elemento
#   - #third -> e : retorna tercer elemento
#   - #fourth -> e : retorna cuarto elemento
#   - #fifth -> e : retorna quinto elemento
#   - #forty_two -> e : retorna elemento 42
#
#   Adding
#   - #prepend(e) -> [e..N] : alias de #unshift
#   - #append(e) -> [0..N,e] : alias de #<<
#
#   Conversions
#   - #to_sentence -> "stred array" : retorna un string que
#     enumera los elementos del array, acepta parametros para
#     formatearlo
#   - #to_formatted_s -> "str" : por default to_s, si se le
#     pasa :db como arg y los elementos responen a #id devuelve
#     str de ids
#   - #to_xml -> "<xml_str>" : retorna un string de que
#     representa a los elementos en XML
#
#   Wrapping
#   - Array#wrap(e) -> [e] : retorna un array que contiene los
#     argumentos pasados
#
#   Duplicating
#   - #deep_dup -> new [] : retorna un duplicado del array
#     original, incluyendo objetos dentro del array
#
#   Grouping
#   - #in_groups_of(N,f) -> [[N]..[N]] : retorna un array de
#     grupos de N elementos cada uno, rellenando con f si es
#     necesario
#   - #split(s) -> [[e][e]] : retorna el array dividido en
#     subgrupos usando s como separador. Tambien se le puede
#     enviar un bloque para distinguir los separadores
#
#
# Hash
#   Conversions
#   - #to_xml -> "<xml_str>" : retorna un string de que
#     representa a los elementos en XML
#
#   Merging
#   - #reverse_merge/! -> {reversed->merge} : (11.2.1)
#   - #reverse_opdate -> alias de reverse_merge
#   - #deep_merge/! -> {rv->merge,{rv->merge}} : reverse merge
#
#   Deep Duplicating
#   - #deep_dup -> { hsh-> {deep->duped}} : hash duplicado en profundo
#
#   Key Manipulation
#   - #execpt/!(:key) -> { hsh -> subset } : quita k->v de :key si está
#   - #transform_keys {blk} -> { trnsf_key -> v } aplica blk a cada key
#   - #stringify_keys -> { "k" -> v } : aplica to_s a a keys
#   - #symbolize_keys -> { symk -> v } : aplica to_sym a las keys (:k o sym)
#   - #to_options/! -> { symk -> v } : aliases of symoblize_keys
#   - #assert_valid_keys(:k,k,'k') -> : passes | ArgumentError, valida keys
#
#   Value Manipulation
#   - #transform_values/! {blk} -> { k -> trnsf_v } : aplica blk a los values
#
#   Slicing
#   - #slice(:k1, :k2) -> {:k1->v, k2->v} : retorna k->vs de :keys coincidentes
#
#   Extracting
#   - #extract!(:k1) -> {:k2->v} : retorna las keys concidentes, modifica hsh
#
#   Compacting
#   - #compact -> {k->v} : retorna hsh sin valores/keys nulos
#
#
# Date
#   Calculations
#   - Date#current -> T[today, cTMZ] : un Date con fecha y timezone local
#   - #prev_year -> D[day, dayn mon yearn-1] : un Date con un año menos
#   - #next_year -> D[day, dayn mon yearn+1] :  un date con un año mas
#   - #prev_month -> D[day, dayn mon-1 yearn] : un Date con un mes menos
#   - #next_month -> D[day, dayn mon+1 yearn] :  un date con un mes mas
#   - #prev_quarter -> D[day, dayn mon-3 yearn] : un Date con 3 meses menos
#   - #next_quarter -> D[day, dayn mon+3 yearn] :  un date con 3 meses mas
#   - #beginning_of_week -> D[day-0..6, dayn mon yearn] : un date con 0-6 dias menos
#   - #end_of_week -> D[day+0..6, dayn mon yearn] : un date con 0-6 dias mas
#   - #monday -> D[day-0..6, dayn mon yearn] : el lunes mas cercano hacia <-
#   - #sunday -> D[day-0..6, dayn mon yearn] : el domingo mas cercano hacia ->
#   - #prev_week(:day = today) -> D[day-7, dayn-7 mon-0,1 yearn] : Date
#   - #next_week(:day = today) -> D[day-7, dayn-7 mon-0,1 yearn]
#   - #beginning_of_month
#   - #end_of_month
#   - #beginning_of_quarter
#   - #end_of_quarter
#   - ...
#   - #advance(Years: +-y, weeks: +-w, months: +-m, days:+-d) -> Date[day+-d,dayn+-d mon+-m year+-y]
#   - #beginnig_of_day
#   - #end_of_day
#   - #beginnig_of_hour
#   - #end_of_hour
#   - #beginnig_of_minute
#   - #end_of_minute
#
#
# Numeric
#   Byte Conversions
#   - #byte/s -> n * 1 : retorna n*1 byte/s
#   - #kilobyte/s -> n * 2^10 : retorna n*1024 bytes
#   - #megabyte/s -> n * 2^20 : returna n*1024^2 bytes
#   - #gigabyte/s -> n * 2^30 : returna n*1024^3 bytes
#   - #petabyte/s -> n * 2^40 : returna n*1024^4 bytes
#   - exa#byte/s -> n * 2^50 : returna n*1024^4 bytes
#
#   Time
#   Calculo de fechas usando cadena de mensaje con un finalizador
#   - #year/s -> n year/s
#   - #month/s -> n month/s
#   - #day/s -> n day/s
#   - #minutes -> n minute/s
#     Finalizadores
#     - #from_now -> Date[now] + cadena
#     - #ago -> Date[now] - cadena
#
#   Formatting
#   Transformaciones varias usando to_s
#   - #to_s(:phone)
#   - #to_s(:phone, option/s: value/s)
#   - #to_s(:currency)
#   - #to_s(:currency, option/s: value/s)
#   - #to_s(:percentage)
#   - #to_s(:percentage, option/s: value/s)
#   - #to_s(:delimited)
#   - #to_s(:delimited, option/s: value/s)
#   - #to_s(:rounded)
#   - #to_s(:rounded, option/s: value/s)
#   - #to_s(:human_size)
#   - #to_s(:human_size, option/s: value/s)
#   - #to_s(:human)
#   - #to_s(:human, option/s: value/s)
