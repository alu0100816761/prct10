require 'bibliografia/bibliog'
require 'bibliografia/lista'

class Cita
    include Comparable
    attr_reader :ref
    
    def initialize (r)
       @ref=r 
    end

    def get_autores
        size = @ref.autores.length
        i = 0
        while i < (size-1)
            cadena = "#{cadena}"+"Autor, "
            cadena = "#{cadena}"+"#{@ref.apellidos[i][0]}. #{@ref.autores[i][0]}. & "
            i = i+1
        end
        cadena = "#{cadena}"+"Autor, "
        cadena = "#{cadena}"+"#{@ref.apellidos[i][0]}. #{@ref.autores[i][0]}. "
    end
    
    def <=>(other)
        return nil unless other.is_a? Cita
        if(@ref.apellidos == other.ref.apellidos)
            if(@ref.anno == other.ref.anno)
                @ref.titulo <=> other.ref.titulo
            else
                @ref.anno <=> other.ref.anno
            end
        else
            @ref.apellidos <=> other.ref.apellidos
        end
    end
    
    def get_titulo
        size = @ref.titulo.length
        @ref.titulo[0] = @ref.titulo[0].capitalize
        i=0
        while i < size
            if (@ref.titulo[i] == " ")
                ref.titulo[i+1] = ref.titulo[i+1].capitalize
            end
            i = i+1
        end
        @ref.titulo
    end
    
    def to_s
        if @ref.instance_of?Libro
            cadena = "#{get_autores}(#{@ref.anno}).  "
            cadena = "#{cadena}"+"Titulo del libro: #{@ref.get_titulo} (#{@ref.get_edicion}).  "
            cadena = "#{cadena}"+"Lugar de publicacion: #{@ref.get_editorial}.  "
        end
        if @ref.instance_of?Revista
            cadena = "#{get_autores}(#{@ref.anno}).  "
            cadena = "#{cadena}"+"Titulo de la revista: #{get_titulo} (#{@ref.get_edicion}).  "
            cadena = "#{cadena}"+"Lugar de publicacion: #{@ref.get_editorial}.  "
        end
        if @ref.instance_of?Periodico
            cadena = "#{get_autores}(#{@ref.anno}).  "
            cadena = "#{cadena}"+"Titulo del articulo: #{@ref.get_titulo} (#{@ref.get_edicion}).  "
            cadena = "#{cadena}"+"Columnas: #{@ref.columnas}.  "
            cadena = "#{cadena}"+"Lugar de publicacion: #{@ref.get_editorial}.  "
        end
        if @ref.instance_of?Electronico
            cadena = "#{get_autores}(#{@ref.anno}).  "
            cadena = "#{cadena}"+"Titulo: #{@ref.get_titulo} (#{@ref.get_edicion}).  "
            cadena = "#{cadena}"+"Lugar de publicacion: #{@ref.get_editorial}.  "
            cadena = "#{cadena}"+"Disponible en: #{@ref.url}  "
        end
        cadena
    end
    
end

class ListaCitas
    attr_accessor :lista, :lordenada
     
    def initialize
        @lista = Lista.new()
    end
    
    def insertar(a)
        aux = @lista.insertar(a)
        @lordenada = @lista.sort
        aux
    end
    
    def extraer
        @lista.extraer
    end
    
end