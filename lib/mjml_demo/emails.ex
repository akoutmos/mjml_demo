defmodule MjmlDemo.Emails do
  use Swoosh.Mailer, otp_app: :mjml_demo

  import Swoosh.Email

  alias __MODULE__.ConfirmationInstructions

  def confirmation_instructions(user, confirmation_url) do
    # You'll want to update the User schema and the DB migration to support
    # storing first+last names, plan tiers, and whatever else you want to
    # associate to the user registration.
    rendered_email =
      ConfirmationInstructions.render(
        first_name: "Agent",
        last_name: "Smith",
        confirmation_url: confirmation_url,
        tier: "Gold"
      )

    new()
    |> to(user.email)
    |> from({"Onboarding Team", "welcome@saas-central.com"})
    |> subject("Welcome to SaaS-Central!")
    |> html_body(rendered_email)
    |> text_body("""
    Hello Agent Smith and thank you for signing up for the Gold plan!!!

    You can confirm your account by visiting the following URL: #{confirmation_url}
    """)
    |> deliver()
  end

  def generate_template(file_path) do
    {:ok, template} =
      file_path
      |> File.read!()
      |> Mjml.to_html()

    ~r/{{\s*([^}^\s]+)\s*}}/
    |> Regex.replace(template, fn _, variable_name ->
      "<%= @#{variable_name} %>"
    end)
  end
end
