import Html exposing (text)

foo : String
foo =
  "HELLO"

bar : List String
bar =
  ["Hello","World"]

message : { text : String, foo : Int }
message =
  { text = "HELLO", foo = 10 }

main =
  text message.text
