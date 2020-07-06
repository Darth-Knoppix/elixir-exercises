defmodule TaskerTest do
  use ExUnit.Case
  doctest Tasker

  test "starts with default empty value" do
    {:ok, pid} = Tasker.start_link([])
    assert Tasker.view(pid) == []
  end

  test "starts with default populated value" do
    {:ok, pid} = Tasker.start_link([{:a, "Do thing", :todo}])
    assert Tasker.view(pid) == [{:a, "Do thing", :todo}]
  end

  test "can add todo" do
    {:ok, pid} = Tasker.start_link([])
    assert Tasker.add(pid, "Do thing") == :ok
  end

  test "todo is assigned an id" do
    {:ok, pid} = Tasker.start_link([])
    Tasker.add(pid, "Do thing")
    [{id, title, completion}] = Tasker.view(pid)

    assert id != nil
    assert title == "Do thing"
    assert completion == :todo
  end

  test "todo can be completed" do
    {:ok, pid} = Tasker.start_link([])
    Tasker.add(pid, "Do thing")
    [{id, _, _}] = Tasker.view(pid)

    {id, title, completion} = Tasker.do_task(pid, id)

    [{_, _, view_completion}] = Tasker.view(pid)
    assert view_completion == :done

    assert id != nil
    assert title == "Do thing"
    assert completion == :done
  end
end
