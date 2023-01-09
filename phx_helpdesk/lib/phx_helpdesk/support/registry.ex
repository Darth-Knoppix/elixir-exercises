defmodule PhxHelpdesk.Support.Registry do
  use Ash.Registry,
    extensions: [
      # This extension adds helpful compile time validations
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry PhxHelpdesk.Support.Ticket
  end
end
