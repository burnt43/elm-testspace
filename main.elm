import Html exposing (div, button, text)
import Html.Events exposing(onClick)
import StartApp.Simple as StartApp

main =
  StartApp.start { model = { text = "" }, view = view, update = update }

view address model =
  div []
    [ button [ onClick address "A" ] [ text "A" ]
    , button [ onClick address "B" ] [ text "B" ]
    , button [ onClick address "C" ] [ text "C" ]
    , div [] [ text model.text ]
    ]

update action model =
  { model | text = model.text ++ action }
