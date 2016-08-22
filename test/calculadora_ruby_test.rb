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

  def test_divisao_e_adicao
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '2/1+1'
    assert_equal 3, result
  end

  def test_multiplicacao_e_subtracao
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '2*1+1'
    assert_equal 3, result
  end

  def test_expressao_completa
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '48-12/3*4+343-33/20'
    assert_equal 373.35, result
  end

  def test_expressao_completa_com_divisao_por_zero
    calculadora = CalculadoraRuby::Calc.new
    result = calculadora.calcular '48-12/0*4+343-33/20'
    assert_equal "Erro de divisao por 0", result
  end

end
