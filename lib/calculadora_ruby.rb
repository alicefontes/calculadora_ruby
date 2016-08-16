require "calculadora_ruby/version"

module CalculadoraRuby

  class Calc

    def initialize
    end

    def calcular calc_string
      @calc_array = calc_string.split('')
      # puts "calc_array: "
      # puts @calc_array
      @valorTotal = 0

      fazMultiplicacoes
      fazDivisoes
      fazAdicoes
      fazSubtracoes

      @valorTotal = @calc_array[0].to_i

      puts "Resultado: "
      puts @valorTotal
    end

    def fazMultiplicacoes
    	index = @calc_array.index("*")

    	if index != nil
	    	if index >= 0

	    		primeiroNumero = @calc_array[index - 1].to_i
	    		segundoNumero = @calc_array[index + 1].to_i

	    		@calc_array[index -1] = primeiroNumero * segundoNumero

	    		@calc_array.delete_at(index + 1)
	    		@calc_array.delete_at(index)

	    		fazMultiplicacoes
	    	end
		  end
    end

    def fazDivisoes
    	index = @calc_array.index("/")

    	if index != nil
	    	if index >= 0

	    		primeiroNumero = @calc_array[index - 1].to_i
	    		segundoNumero = @calc_array[index + 1].to_i

	    		@calc_array[index -1] = primeiroNumero / segundoNumero

	    		@calc_array.delete_at(index + 1)
	    		@calc_array.delete_at(index)

	    		fazDivisoes
	    	end
	    end
    end

    def fazAdicoes
    	index = @calc_array.index("+")

    	if index != nil
	    	if index >= 0

	    		primeiroNumero = @calc_array[index - 1].to_i
	    		#puts "primeiroNumero: "
	    		#puts primeiroNumero

	    		segundoNumero = @calc_array[index + 1].to_i
	    		#puts "segundoNumero: "
	    		#puts segundoNumero

	    		#puts "soma: "
	    		#puts primeiroNumero + segundoNumero

	    		@calc_array[index - 1] = primeiroNumero + segundoNumero
	    		#puts "novo item no index: "
	    		#puts @calc_array[index - 1]

	    		@calc_array.delete_at(index + 1)
	    		@calc_array.delete_at(index)

	    		#puts "novoarray: "
	    		#puts @calc_array

	    		fazAdicoes
	    	end
		  end
    end

    def fazSubtracoes
    	index = @calc_array.index("-")

    	if index != nil
	    	if index >= 0

	    		primeiroNumero = @calc_array[index - 1].to_i
	    		segundoNumero = @calc_array[index + 1].to_i

	    		@calc_array[index -1] = primeiroNumero - segundoNumero

	    		@calc_array.delete_at(index + 1)
	    		@calc_array.delete_at(index)

	    		fazSubtracoes
	    	end
	    end
	  end

  end
end
