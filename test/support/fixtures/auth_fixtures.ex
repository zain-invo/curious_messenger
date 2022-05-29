defmodule CuriousMessenger.AuthFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CuriousMessenger.Auth` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        nickname: "some nickname"
      })
      |> CuriousMessenger.Auth.create_user()

    user
  end
end
