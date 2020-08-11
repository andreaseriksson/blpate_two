defmodule BplateTwoWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :bplate_two

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
