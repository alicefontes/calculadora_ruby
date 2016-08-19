require "./calculadora_ruby/version"

module CalculadoraRuby

	class Calc

		def initialize
		end

		def calcular calc_string
			@calc_array = calc_string.split('')
			# puts "calc_array: "
			# puts @calc_array

			@valorTotal = 0
			# puts "incializa: "
			# puts @valorTotal

			operacoesPrioritarias
			operacoesSecundarias

			@valorTotal = @calc_array[0].to_f

			puts "---valorTotal: "
			puts @valorTotal

			return @valorTotal
		end

		def operacoesPrioritarias
			indexMultiplicacao = @calc_array.index("*")
			indexDivisao = @calc_array.index("/")

			if(indexDivisao != nil && indexMultiplicacao != nil)
				if(indexDivisao < indexMultiplicacao)
					fazDivisoes
				else
					fazMultiplicacoes
				end
			elsif(indexDivisao != nil && indexMultiplicacao == nil)
				fazDivisoes
			elsif(indexDivisao == nil && indexMultiplicacao != nil)
				fazMultiplicacoes
			end
		end

		def operacoesSecundarias
			indexAdicao = @calc_array.index("+")
			indexSubtracao = @calc_array.index("-")

			if(indexSubtracao != nil && indexAdicao != nil)
				if(indexSubtracao < indexAdicao)
					fazSubtracoes
				else
					fazAdicoes
				end
			elsif(indexSubtracao != nil && indexAdicao == nil)
				fazSubtracoes
			elsif(indexSubtracao == nil && indexAdicao != nil)
				fazAdicoes
			end
		end

		def buscaPrimeiroNumeroIndex index
			index.downto(0) do |i|
				character = @calc_array[i];

        if character == "*" || character == "/" || character == "+" || character == "-"
					return i + 1
				end
			end

			return 0
		end

		def buscaSegundoNumeroIndex index
			(index..(@calc_array.length - 1)).each do |i|

				character = @calc_array[i]

				if character == "*" || character == "/" || character == "+" || character == "-"
					return i - 1
				end
			end

			return @calc_array.length - 1
		end

		def buscaNumeroNoRange(indexInicial, indexFinal)
			primeiroNumero = "0"
			(indexInicial..indexFinal).each do |i|
				character = @calc_array[i]
				primeiroNumero = primeiroNumero + character
			end

			return primeiroNumero.to_f
		end

		def deletaObjetoNoRangeDoArray(fromIndex, toIndex)
			# puts "array a remover:"
			# puts @calc_array

			toIndex.downto(fromIndex) do |i|
				# puts "i: "
				# puts i
				@calc_array.delete_at(i)
				# puts "array:"
				# @calc_array
			end
		end

		def fazMultiplicacoes
			index = @calc_array.index("*")

			if index != nil
				if index >= 0

					primeiroIndex = buscaPrimeiroNumeroIndex (index - 1)
					segundoIndex = buscaSegundoNumeroIndex (index + 1)

					primeiroNumero = buscaNumeroNoRange(primeiroIndex, (index - 1))
					segundoNumero = buscaNumeroNoRange((index + 1), segundoIndex)

					resultado = primeiroNumero * segundoNumero

					@calc_array[primeiroIndex] = "#{resultado}"

					deletaObjetoNoRangeDoArray((primeiroIndex + 1), segundoIndex)

					operacoesPrioritarias
				end
			end
		end

		def fazDivisoes
			index = @calc_array.index("/")

			if index != nil
				if index >= 0

					primeiroIndex = buscaPrimeiroNumeroIndex(index - 1)
					segundoIndex = buscaSegundoNumeroIndex(index + 1)

					primeiroNumero = buscaNumeroNoRange(primeiroIndex, (index - 1))
					segundoNumero = buscaNumeroNoRange((index + 1), segundoIndex)

					resultado = primeiroNumero / segundoNumero

					@calc_array[primeiroIndex] = "#{resultado}"

					deletaObjetoNoRangeDoArray((primeiroIndex + 1), segundoIndex)

					operacoesPrioritarias
				end
			end
		end

		def fazAdicoes

			index = @calc_array.index("+")

			if index != nil
				if index >= 0

					primeiroIndex = buscaPrimeiroNumeroIndex (index - 1)
					# puts "primeiroIndex: "
					# puts primeiroIndex

					segundoIndex = buscaSegundoNumeroIndex (index + 1)
					# puts "segundoIndex: "
					# puts segundoIndex

					primeiroNumero = buscaNumeroNoRange(primeiroIndex, (index - 1))
					# puts "primeiroNumero: "
					# puts primeiroNumero

					segundoNumero = buscaNumeroNoRange((index + 1), segundoIndex)
					# puts "segundoNumero: "
					# puts segundoNumero

					resultado = primeiroNumero + segundoNumero
					# puts "resultado: "
					# puts resultado

					@calc_array[primeiroIndex] = "#{resultado}"
					# puts "novo item no index: "
					# puts @calc_array[primeiroIndex]

					deletaObjetoNoRangeDoArray((primeiroIndex + 1), segundoIndex)

					# puts "novoarray: "
					# puts @calc_array

					operacoesSecundarias

				end
			end
		end

		def fazSubtracoes
			index = @calc_array.index("-")

			if index != nil
				if index >= 0

					primeiroIndex = buscaPrimeiroNumeroIndex (index - 1)
					segundoIndex = buscaSegundoNumeroIndex (index + 1)

					primeiroNumero = buscaNumeroNoRange(primeiroIndex, (index - 1))
					segundoNumero = buscaNumeroNoRange((index + 1) , segundoIndex)

					resultado = primeiroNumero - segundoNumero

					@calc_array[primeiroIndex] = "#{resultado}"

					deletaObjetoNoRangeDoArray((primeiroIndex + 1), segundoIndex)

					operacoesSecundarias

				end
			end
		end

	end
end
