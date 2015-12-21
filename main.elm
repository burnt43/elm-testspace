import Html exposing (div, button, text, h1, ul, li)
import Html.Events exposing(onClick)
import StartApp.Simple as StartApp
import String

someInt : Int
someInt =
  100

names : List String
names =
  ["James", "Edward", "Carson"]

person : { name : String, age: Int }
person =
  { name = "Jim", age = 28 }

type Lift = Deadlift | Clean | Squat

uselessFunction : Lift
uselessFunction =
  Squat

type RustLikeSome = None | Some String

stupidFunction : Int -> RustLikeSome
stupidFunction n =
  if n > 0 then Some "string" else None


main =
  StartApp.start { model = { text = "" }, view = view, update = update }

view address model =
  div []
    [ div []
        [ h1 [] [ text "Update Stuff" ]
        , button [ onClick address "A" ] [ text "A" ]
        , button [ onClick address "B" ] [ text "B" ]
        , button [ onClick address "C" ] [ text "C" ]
        , div [] [ text model.text ]
        ],
      div []
        [ h1 [] [ text "Other" ]
        , ul []
          [ li [] [ text ( toString someInt ) ]
          , li [] [ text ( toString ( List.length names ) ) ]
          , li [] [ text person.name ]
          , li [] [ text (
              case uselessFunction of
                Deadlift -> "deadlift"
                Clean    -> "clean"
                Squat    -> "squat"
              )
            ]
          , li [] [ text (
              case stupidFunction 0 of
                None -> "got nothing"
                Some s -> s 
              )
            ]
          , li [] [ text (
              case stupidFunction 1 of
                None -> "got nothing"
                Some s -> s 
              )
            ]
          ]
        ]
    ]

update action model =
  { model | text = model.text ++ action }
