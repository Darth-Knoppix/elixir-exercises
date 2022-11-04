defmodule Lasagna do
  @cooking_time 40

  def expected_minutes_in_oven(), do: @cooking_time

  @spec remaining_minutes_in_oven(number) :: number
  def remaining_minutes_in_oven(elapsed), do: expected_minutes_in_oven() - elapsed

  @spec preparation_time_in_minutes(number) :: number
  def preparation_time_in_minutes(layers), do: layers * 2

  @spec total_time_in_minutes(number, number) :: number
  def total_time_in_minutes(layers, elapsed), do: preparation_time_in_minutes(layers) + elapsed

  def alarm(), do: "Ding!"
end
