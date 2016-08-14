require "calculadora_ruby/version"

module CalculadoraRuby
  class Calc
    def initialize
    end

    def calcular calc_string
      @calc_array = calc_string.split('')
      operacao_prioritaria
      operacao_comum
    end
#trata aqui em cima p numeros maiores q 9

    def operacao_prioritaria
      for numero in @calc_array
      # while @calc_array.index != @calc_array.length
    #  while @calc_array.index <= @calc_array.length
        if numero == "*" || numero == "/"
        # if @calc_array.each == "*" || @calc_array.each == "/"
          sinal_prioritario
          # opera
        end
      end
    end

    def operacao_comum
      for numero in @calc_array
      # while @calc_array.each != nil
        # if @calc_array.each == "+" || @calc_array.each == "-"
        if numero == "+" || numero == "-"
          sinal_comum
          # opera
        end
      end
    end

    def sinal_prioritario
      @sinal = @calc_array.index do |sinaleach|
        sinaleach == "*" || sinaleach == "/"
      end
      organiza_operacao
      opera
    end

    def sinal_comum
      @sinal = @calc_array.index do |sinaleach|
        sinaleach == "+" || sinaleach == "-"
      end
      organiza_operacao
      opera
    end

    def organiza_operacao
      @n1 = @calc_array[@sinal - 1]
      @op = @calc_array[@sinal]
      @n2 = @calc_array[@sinal + 1]
    end


    # def operacoes_calc
    #   index = @calc_array.index { |x| x == "*" || x == "/" || x == "+" || x == '-' }
    #   @n1 = @calc_array[index - 1]
    #   @op = @calc_array[index]
    #   @n2 = @calc_array[index + 1]
    # end


#identifica a posicao do sinal e dos numeros a serem operados
    # def operacoes_calc
    #   index = @calc_array.index { |x| x == "+" || x == "-" }
    #   @n1 = @calc_array[index - 1]
    #   @op = @calc_array[index]
    #   @n2 = @calc_array[index + 1]
    # end

    def opera
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
