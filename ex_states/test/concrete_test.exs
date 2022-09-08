defmodule ConcreteTest do
  use ExUnit.Case

  test "should update count" do
    rented_video = VideoStore.renting(video())
    assert rented_video.times_rented == 1
  end

  test "should rent video" do
    rented_video = VideoStore.Concrete.rent(video())
    assert rented_video.state == :rented
  end

  test "should handle multiple transitions" do
    import VideoStore.Concrete
    vid = video() |> rent |> return() |> rent |> return()
    assert vid.times_rented == 2
    assert Enum.count(vid.log) == 4
  end

  def video, do: %Video{title: "Star Wars"}
end
