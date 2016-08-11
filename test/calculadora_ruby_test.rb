require 'test_helper'

class CalculadoraRubyTest < Minitest::Test
  def test_adicao_basica
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '1+1'
    assert_equal 2, result
  end
  def test_subtracao_basica
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '2-1'
    assert_equal 1, result
  end
  def test_subtracao_negativa
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '0-1'
    assert_equal -1, result
  end
  def test_multiplicacao_basica
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '1*3'
    assert_equal 3, result
  end
  def test_divisao_basica
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '2/1'
    assert_equal 2, result
  end
end
