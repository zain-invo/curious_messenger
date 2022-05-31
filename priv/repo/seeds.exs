# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CuriousMessenger.Repo.insert!(%CuriousMessenger.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias CuriousMessenger.Auth.User
alias CuriousMessenger.Chat.{Conversation, ConversationMember}

alias CuriousMessenger.{Auth, Chat}

user1 =
CuriousMessenger.Repo.insert!(
  %CuriousMessenger.Auth.User{
    email: "test1@gmail.com",
    password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("Password"),
    nickname: "test1",
  },
  on_conflict: :nothing
)
user2 =
CuriousMessenger.Repo.insert!(
  %CuriousMessenger.Auth.User{
    email: "test2@gmail.com",
    password_hash: Pow.Ecto.Schema.Password.pbkdf2_hash("Password"),
    nickname: "test2",
  },
  on_conflict: :nothing
)

{:ok, %Conversation{id: conv_id} = conversation} =
  Chat.create_conversation(%{
    title: "Modern Talking"
  })

# {:ok, %Conversation{id: conv_id} = conversation} =
#   Chat.create_conversation(%{
#     title: "Modern Talking",
#     conversation_members: [%{user_id: u1_id, owner: true}, %{user_id: u2_id, owner: false}]
#   })

{:ok, %ConversationMember{}} =
  Chat.create_conversation_member(%{conversation_id: conv_id, user_id: user1.id, owner: true})

{:ok, %ConversationMember{}} =
  Chat.create_conversation_member(%{conversation_id: conv_id, user_id: user2.id, owner: false})
