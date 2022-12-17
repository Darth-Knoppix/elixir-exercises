defmodule JWTAuthTest do
  use ExUnit.Case
  doctest JWTAuth

  test "greets the world" do
    assert JWTAuth.hello() == :world
  end
end
