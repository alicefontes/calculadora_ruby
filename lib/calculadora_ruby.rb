require "calculadora_ruby/version"

module CalculadoraRuby
  class Calc
    def initialize
    end

    def calcular calc_string
      @calc_array = calc_string.split('')
#      avisaquenasceu
      operacoes_calc
      achaoperacao
    end

#    def avisaquenasceu
#      puts @@calc_array
#    end

#teste

    def operacoes_calc
      index = @calc_array.index { |x| x == "*" || x == "/" || x == "+" || x == '-' }
      @n1 = @calc_array[index - 1]
      @op = @calc_array[index]
      @n2 = @calc_array[index + 1]
    end

#identifica a posicao do sinal e dos numeros a serem operados
    # def operacoes_calc
    #   index = @calc_array.index { |x| x == "+" || x == "-" }
    #   @n1 = @calc_array[index - 1]
    #   @op = @calc_array[index]
    #   @n2 = @calc_array[index + 1]
    # end

    def achaoperacao
      if @op === "+"
        soma @n1.to_i, @n2.to_i
      elsif @op === "-"
        subtracao @n1.to_i, @n2.to_i
      elsif @op === '*'
        multiplicacao @n1.to_i, @n2.to_i
      elsif @op === '/'
        divisao @n1.to_i, @n2.to_i
      else
        'erro'
      end
    end

    def soma n1, n2
      n1 + n2
    end

    def subtracao n1, n2
      n1 - n2
    end

    def multiplicacao n1, n2
      n1 * n2
    end

    def divisao n1, n2
      n1 / n2
    end
  end
end
