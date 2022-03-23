defmodule SimplePlugStaticTest do
  use ExUnit.Case
  doctest SimplePlugStatic

  test "greets the world" do
    assert SimplePlugStatic.hello() == :world
  end
end
