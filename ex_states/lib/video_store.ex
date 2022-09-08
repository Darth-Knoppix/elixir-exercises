defmodule VideoStore do
  @spec renting(%Video{}) :: %Video{}
  def renting(video) do
    vid = log(video, "Renting #{video.title}")
    %Video{vid | times_rented: video.times_rented + 1}
  end

  @spec returning(%Video{}) :: %Video{}
  def returning(video), do: log(video, "Returning #{video.title}")

  @spec losing(%Video{}) :: %Video{}
  def losing(video), do: log(video, "Losing #{video.title}")

  @spec log(%Video{}, String.t()) :: %Video{}
  def log(video, message) do
    %Video{video | log: [message | video.log]}
  end
end
