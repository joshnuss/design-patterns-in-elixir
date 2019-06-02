defmodule BankAccount do
  use GenServer

  @initial_state %{
    balance: 0,
    transactions: []
  }

  def start_link do
    GenServer.start_link(__MODULE__, @initial_state)
  end

  def init(state) do
    {:ok, state}
  end

  def deposit(account, money) do
    GenServer.call(account, {:deposit, money})
  end

  def withdraw(account, money) do
    GenServer.call(account, {:withdraw, money})
  end

  def balance(account) do
    GenServer.call(account, :balance)
  end

  def handle_call({:deposit, money}, _from, state) when money > 0 do
    new_state = %{
      balance: state.balance + money,
      transactions: [{:deposit, money} | state.transactions]
    }

    {:reply, {:ok, new_state.balance}, new_state}
  end

  def handle_call({:withdraw, money}, _from, state = %{balance: balance}) when money < balance do
    new_state = %{
      balance: state.balance - money,
      transactions: [{:withdraw, money} | state.transactions]
    }

    {:reply, {:ok, new_state.balance}, new_state}
  end

  def handle_call(:balance, _from, state) do
    {:reply, {:ok, state.balance}, state}
  end
end

# hide balance: whenever the message :balance is sent, return {:ok, :hidden}
defmodule PrivacyProxy do
  def intercept(account) do
    receive do
      {:"$gen_call", from, :balance} ->
        GenServer.reply(from, {:ok, :hidden})

      {:"$gen_call", from, message} ->
        # forward everything else
        result = GenServer.call(account, message)
        GenServer.reply(from, result)
    end

    # continue intercepting
    intercept(account)
  end
end

{:ok, account} = BankAccount.start_link()

# without interceptor
BankAccount.deposit(account, 100) |> IO.inspect()
BankAccount.withdraw(account, 10) |> IO.inspect()

# spawn a proxy to intercept
proxy = spawn(PrivacyProxy, :intercept, [account])

# calls to balance are now intercepted
BankAccount.balance(proxy) |> IO.inspect()
BankAccount.deposit(proxy, 10) |> IO.inspect()
