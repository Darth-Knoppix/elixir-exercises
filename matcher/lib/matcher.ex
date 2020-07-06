defmodule Matcher do
  def email_message([]) do
    "No new messages"
  end

  def email_message([message]) do
    "First message: #{message}"
  end

  def email_message([message | others]) do
    count = Enum.count(others)
    "First message: #{message}, #{count} messages"
  end
end
