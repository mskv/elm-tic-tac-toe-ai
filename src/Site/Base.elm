module Site.Base exposing (init, update, view, subscriptions)

import Html exposing (Html, text)

type alias Model =
  {
  }

type Msg =
  Empty

init : (Model, Cmd Msg)
init =
  (initialState, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  (model, Cmd.none)

view : Model -> Html Msg
view model =
  text "hello world"

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- private

initialState : Model
initialState =
  {
  }
