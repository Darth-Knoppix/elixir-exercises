defmodule CookieAuthTest do
  use ExUnit.Case
  doctest CookieAuth

  test "greets the world" do
    assert CookieAuth.hello() == :world
  end
end
