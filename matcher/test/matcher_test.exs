defmodule MatcherTest do
  use ExUnit.Case
  doctest Matcher

  test "empty" do
    assert Matcher.email_message([]) == "No new messages"
  end

  test "one" do
    assert Matcher.email_message(["A message"]) == "First message: A message"
  end

  test "many" do
    assert Matcher.email_message(["The first", "of many", "messages"]) ==
             "First message: The first, 2 messages"
  end
end
