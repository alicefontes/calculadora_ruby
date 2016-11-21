require "calculadora_ruby/version"

module CalculadoraRuby
	class Calc
		def calcular calc_string
			@calc_array = calc_string.split('')

			valorTotal = 0

			operacoesPrioritarias
			operacoesSecundarias

			resposta = @calc_array[0]
			if resposta == "Erro de divisao por 0"
				# puts "---valorTotal: " + resposta
				return resposta
			else
				valorTotal = @calc_array[0].to_f
				# puts "---valorTotal: #{valorTotal}"
				return valorTotal
			end
		end

		def operacoesPrioritarias
			indexMultiplicacao = @calc_array.index("*")
			indexDivisao = @calc_array.index("/")

			if(indexDivisao != nil && indexMultiplicacao != nil)
				if(indexDivisao < indexMultiplicacao)
					calculaOperacao("/", indexDivisao)
				else
					calculaOperacao("*", indexMultiplicacao)
				end
			elsif(indexDivisao != nil && indexMultiplicacao == nil)
				calculaOperacao("/", indexDivisao)
			elsif(indexDivisao == nil && indexMultiplicacao != nil)
				calculaOperacao("*", indexMultiplicacao)
			end
		end

		def operacoesSecundarias
			indexAdicao = @calc_array.index("+")
			indexSubtracao = @calc_array.index("-")

			if(indexSubtracao != nil && indexAdicao != nil)
				if(indexSubtracao < indexAdicao)
					calculaOperacao("-", indexSubtracao)
				else
					calculaOperacao("+", indexAdicao)
				end
			elsif(indexSubtracao != nil && indexAdicao == nil)
				calculaOperacao("-", indexSubtracao)
			elsif(indexSubtracao == nil && indexAdicao != nil)
				calculaOperacao("+", indexAdicao)
			end
		end

		def buscaPrimeiroIndexDoPrimeiroNumero ultimoIndexDoPrimeiroNumero
			ultimoIndexDoPrimeiroNumero.downto(0) do |i|
				character = @calc_array[i]

        if character == "*" || character == "/" || character == "+" || character == "-"
					return i + 1
				end
			end

			return 0
		end

		def buscaUltimoIndexDoSegundoNumero primeiroIndexDoSegundoNumero
			(primeiroIndexDoSegundoNumero..(@calc_array.length - 1)).each do |i|

				character = @calc_array[i]

				if character == "*" || character == "/" || character == "+" || character == "-"
					return i - 1
				end
			end

			return @calc_array.length - 1
		end

		def buscaNumeroNoRange(indexInicial, indexFinal)
			# contatena os numeros do range no array como string
			numero = ""
			(indexInicial..indexFinal).each do |i|
				character = @calc_array[i]
				numero = numero + character
			end

			return numero.to_f
		end

		def deletaObjetoNoRangeDoArray(indexInicial, indexFinal)
			indexFinal.downto(indexInicial) do |i|
				@calc_array.delete_at(i)
			end
		end

		def calculaOperacao(operacao, indexDoSinal)
			ultimoIndexDoPrimeiroNumero = indexDoSinal - 1
			primeiroIndexDoSegundoNumero = indexDoSinal + 1

			primeiroIndexDoPrimeiroNumero = buscaPrimeiroIndexDoPrimeiroNumero(ultimoIndexDoPrimeiroNumero)
			ultimoIndexDoSegundoNumero = buscaUltimoIndexDoSegundoNumero(primeiroIndexDoSegundoNumero)

			primeiroNumero = buscaNumeroNoRange(primeiroIndexDoPrimeiroNumero, ultimoIndexDoPrimeiroNumero)
			segundoNumero = buscaNumeroNoRange(primeiroIndexDoSegundoNumero, ultimoIndexDoSegundoNumero)

			resultado = 0
			ehOperacaoPrioritaria = false

			case operacao
				when "*"
					resultado = primeiroNumero * segundoNumero
					ehOperacaoPrioritaria = true
				when "/"
					if segundoNumero == 0
						@calc_array = ["Erro de divisao por 0"]
						return
					end
					resultado = primeiroNumero / segundoNumero
					ehOperacaoPrioritaria = true
				when "+"
					resultado = primeiroNumero + segundoNumero
				when "-"
					resultado = primeiroNumero - segundoNumero
				else
					resultado = 0
			end

			@calc_array[primeiroIndexDoPrimeiroNumero] = "#{resultado}"

			deletaObjetoNoRangeDoArray((primeiroIndexDoPrimeiroNumero + 1), ultimoIndexDoSegundoNumero)

			if ehOperacaoPrioritaria
				operacoesPrioritarias
			else
				operacoesSecundarias
			end
		end
	end
end

# c = CalculadoraRuby::Calc.new
# puts "Digite a expressao:"
# calcString = $stdin.readline()
# c.calcular calcString
