require_relative 'conta'

class ContaCorrente < Conta
  attr_accessor :limite

  def initialize(numero, titular, saldo, limite)
    super(numero, titular, saldo)
    @limite = limite
  end

  def sacar(valor)
    if (@saldo + @limite) >= valor
      @saldo -= valor
    else
      puts 'Não foi possível executar o saque'
    end
  end

  def transferir(conta_destino, valor)
    sacar(valor)
    conta_destino.depositar(valor)
  end

end
