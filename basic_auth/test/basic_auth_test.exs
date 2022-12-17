defmodule BasicAuthTest do
  use ExUnit.Case
  doctest BasicAuth

  test "greets the world" do
    assert BasicAuth.hello() == :world
  end
end
