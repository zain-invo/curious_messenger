defmodule CuriousMessenger.ChatFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CuriousMessenger.Chat` context.
  """

  @doc """
  Generate a conversation.
  """
  def conversation_fixture(attrs \\ %{}) do
    {:ok, conversation} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> CuriousMessenger.Chat.create_conversation()

    conversation
  end

  @doc """
  Generate a conversation_member.
  """
  def conversation_member_fixture(attrs \\ %{}) do
    {:ok, conversation_member} =
      attrs
      |> Enum.into(%{
        owner: true
      })
      |> CuriousMessenger.Chat.create_conversation_member()

    conversation_member
  end

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> CuriousMessenger.Chat.create_message()

    message
  end

  @doc """
  Generate a emoji.
  """
  def emoji_fixture(attrs \\ %{}) do
    {:ok, emoji} =
      attrs
      |> Enum.into(%{
        key: "some key",
        unicode: "some unicode"
      })
      |> CuriousMessenger.Chat.create_emoji()

    emoji
  end

  @doc """
  Generate a message_reaction.
  """
  def message_reaction_fixture(attrs \\ %{}) do
    {:ok, message_reaction} =
      attrs
      |> Enum.into(%{

      })
      |> CuriousMessenger.Chat.create_message_reaction()

    message_reaction
  end

  @doc """
  Generate a seen_message.
  """
  def seen_message_fixture(attrs \\ %{}) do
    {:ok, seen_message} =
      attrs
      |> Enum.into(%{

      })
      |> CuriousMessenger.Chat.create_seen_message()

    seen_message
  end
end
