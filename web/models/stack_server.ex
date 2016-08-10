defmodule Pong.StackServer do
  use GenServer

  # TODO - You need to make these tests pass
  #
  # GenServer callback signatures look like this:
  #
  # def handle_cast({:name, args, ...}, state) do
  #   {:noreply, new_state}
  # end
  #
  # def handle_call({:name, args}, _from, state) do
  #   {:reply, {:ok, value}, new_state}
  # end

  def add(server, item) do
    GenServer.cast(server, {:add, item})
  end

  def pop(server) do
    GenServer.call(server, {:pop})
  end

  def get_state(server) do
    GenServer.call(server, {:get_state})
  end

  def handle_cast({:add, item}, state) do
    {:noreply, [item | state]}
  end

  def handle_call({:pop}, _from, [head | tail]) do
    {:reply, {:ok, head}, tail}
  end

  def handle_call({:get_state}, _from, state) do
    {:reply, {:ok, state}, state}
  end

end
