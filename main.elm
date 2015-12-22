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

someList : List String
someList =
  [ "Red", "Blue", "Green" ]

toLi s =
  li [] [ text s ]

type Color = Red | Blue | Green

colors : List Color
colors =
  [ Red, Blue, Green ]

colorToString : Color -> String
colorToString color =
  case color of
    Red -> "Red"
    Blue -> "Blue"
    Green -> "Green"

type JimNumber
  = Regular ( Int )
  | Tuple ( (Int,Int) )

jimNumberToString : JimNumber -> String
jimNumberToString x =
  case x of
    Regular n -> toString n
    Tuple (a,b) -> toString ( a+b )

oddOrNothing : Int -> Maybe Int
oddOrNothing n =
  if n % 2 == 0 then Nothing else Just n

bunchOfNumbers : List Int
bunchOfNumbers =
  [1,2,3,4,5,6]

foobarFunction0000 n =
  case oddOrNothing n of
    Just x -> li [] [ text (toString x) ]
    Nothing -> li [] [ text "null(is a bad word!)" ]

type LList t = Empty | Node t (LList t)
foobar0 : LList Int
foobar0 =
  Node 5 (Node 10 Empty)

sumLList : LList Int -> Int
sumLList list =
  case list of
    Empty -> 0
    Node value rest ->
      value + sumLList rest

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
        [ h1 [] [ text "Random Stuff" ]
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
        ],
      div []
        [ h1 [] [ text "Random Stuff 2" ]
        , ul [] (List.map toLi someList)
        ],
      div []
        [ h1 [] [ text "Random Stuff 3" ]
        , ul [] (List.map toLi (List.map colorToString colors) )
        ],
      div []
        [ h1 [] [ text "Random Stuff 4" ]
        , ul [] [
            li [] [ text ( jimNumberToString (Regular 3) ) ]
          , li [] [ text ( jimNumberToString (Tuple (4,5)) ) ]
          ]
        ],
      div []
        [ h1 [] [ text "Random Stuff 5" ]
        , ul [] (List.map foobarFunction0000 bunchOfNumbers)
        ],
      div []
        [ h1 [] [ text "Random Stuff 6" ]
        , ul [] 
          [ li [] [ text ( toString ( sumLList foobar0 ) ) ]
          ]
        ]
    ]

update action model =
  { model | text = model.text ++ action }
