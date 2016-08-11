require "calculadora_ruby/version"

module CalculadoraRuby
  class Calc
    def initialize calc_string
      @calc_array = calc_string.split('')
      #avisaquenasceu
      operacoes_calc
    end

    def avisaquenasceu
      puts @calc_array
    end

    def operacoes_calc
      index = @calc_array.index { |x| x == "+" }
      n1 = array[index - 1]
      op = array[index]
      n2 = array[index + 1]
    end

    if op === "+"
        puts resultadosoma
    elsif op === "-"
        puts resultadodiferenca
    else
        puts 'erro'
    end

    def + n2
      resultadosoma = n1
      resultadosoma += n2
    end
    def - n2
      resultadodiferenca = n1
      resultadodiferenca -= n2
    end
  end
end
