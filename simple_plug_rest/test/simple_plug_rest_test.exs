defmodule SimplePlugRestTest do
  use ExUnit.Case
  doctest SimplePlugRest

  test "greets the world" do
    assert SimplePlugRest.hello() == :world
  end
end
