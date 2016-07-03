defmodule Emailapp.Mailer do
  use Mailgun.Client,
      domain: Application.get_env(:emailapp, :mailgun_domain),
      key:    Application.get_env(:emailapp, :mailgun_key)

  def my_first_email(email_address) do
    send_email to: email_address,
               from: "test@example.com",
               subject: "My first email",
               text: "This is an email send with Phoenix and Mailgun"
  end

  def send_email(recipient, subject, content) do
    send_email to: recipient,
               from: "your@email.com",
               subject: subject,
               text: content,
               html: content
  end
end
