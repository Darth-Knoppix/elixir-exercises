defmodule PhxHelpdesk.Support do
  use Ash.Api,
    extensions: [
      AshGraphql.Api
    ]

  graphql do
    # Defaults to `true`, use this to disable authorization for the entire API (you probably only want this while prototyping)
    authorize?(false)
  end

  resources do
    # This defines the set of resources that can be used with this API
    registry PhxHelpdesk.Support.Registry
  end
end
