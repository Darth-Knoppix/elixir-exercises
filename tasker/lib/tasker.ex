defmodule Tasker do
  use GenServer

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def add(pid, element) do
    task = {make_ref(), element, :todo}
    GenServer.cast(pid, {:add, task})
  end

  def view(pid) do
    GenServer.call(pid, {:view})
  end

  def do_task(pid, id) do
    GenServer.call(pid, {:do_task, id})
  end

  @impl true
  def init(todos) do
    {:ok, todos}
  end

  @impl true
  def handle_call({:do_task, id}, _from, state) do
    new_state =
      Enum.map(state, fn
        {^id, task, _} ->
          {id, task, :done}

        el ->
          el
      end)

    new_el = Enum.find(new_state, fn el -> match?({^id, _, _}, el) end)

    {:reply, new_el, new_state}
  end

  @impl true
  def handle_call({:view}, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:add, element}, state) do
    {:noreply, [element | state]}
  end
end
