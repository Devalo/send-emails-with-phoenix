defmodule Emailapp.EmailController do
  use Emailapp.Web, :controller
  alias Emailapp.Email

  def index(conn, _params) do
    changeset = Email.changeset(%Email{})
    emails = Repo.all(Email)
    render(conn, "index.html", changeset: changeset, emails: emails)
  end

  def create(conn, %{"email" => email_params, "email" => %{"recipient" => recipient, "subject" => subject, "content" => content}}) do
    changeset = Email.changeset(%Email{}, email_params)
    emails = Repo.all(Email)

    case Repo.insert(changeset) do
      {:ok, email} ->
        Emailapp.Mailer.send_email(recipient, subject, content)
        conn
        |> put_flash(:info, "Email sent")
        |> redirect(to: email_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong")
        |> render("index.html", changeset: changeset, emails: emails)
    end
  end


end
