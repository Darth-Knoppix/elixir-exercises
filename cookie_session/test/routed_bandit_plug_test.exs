defmodule CookieSessionTest do
  use ExUnit.Case
  doctest CookieSession

  test "greets the world" do
    assert CookieSession.hello() == :world
  end
end
