defmodule RoutedBanditPlugTest do
  use ExUnit.Case
  doctest RoutedBanditPlug

  test "greets the world" do
    assert RoutedBanditPlug.hello() == :world
  end
end
