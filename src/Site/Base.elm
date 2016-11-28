module Site.Base exposing (init, update, view, subscriptions)

import Html exposing (Html, button, select, option, text, div, span)
import Html.Events exposing (onClick, onInput, on)
import Html.Attributes exposing (..)
import Svg exposing (svg)
import Svg.Attributes exposing (..)
import Json.Decode as Json

import Game.Base as Game
import Game.Player exposing (..)

import Debug

type alias Model =
  { game : Game.Model
  , firstPlayerDropdownValue : String
  , secondPlayerDropdownValue : String
  }

type Msg
  = GameMsg Game.Msg
  | SelectFirstPlayerType String
  | SelectSecondPlayerType String

init : (Model, Cmd Msg)
init =
  (initialState, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SelectFirstPlayerType playerType ->
      ({ model | firstPlayerDropdownValue = playerType }, Cmd.none)
    SelectSecondPlayerType playerType ->
      ({ model | secondPlayerDropdownValue = playerType }, Cmd.none)
    _ ->
      (model, Cmd.none)

view : Model -> Html Msg
view model =
  pageContainer
    [ gameSettingsContainer
        [ span [] [ text "First player: " ]
        , selectPlayerType SelectFirstPlayerType
        , span [ Html.Attributes.style [ ("margin-left", "10px") ] ] [ text "Second player: " ]
        , selectPlayerType SelectSecondPlayerType
        ]
    , svgContainer
        [ Html.map GameMsg (Game.view model.game) ]
    ]

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- private

initialState : Model
initialState =
  { game = Game.initialState
  , firstPlayerDropdownValue = "Human"
  , secondPlayerDropdownValue = "Human"
  }

pageContainer : List (Html Msg) -> Html Msg
pageContainer children =
  div
    [ Html.Attributes.style [ ("height", "100%"), ("width", "100%"), ("text-align", "center") ] ]
    children

gameSettingsContainer : List (Html Msg) -> Html Msg
gameSettingsContainer children =
  div [ Html.Attributes.style [ ("margin-bottom", "20px") ] ] children

svgContainer : List (Html Msg) -> Html Msg
svgContainer children =
  svg
    [ viewBox "0 0 1000 1000", Svg.Attributes.style "width: 100%; height: 100%;" ]
    children

selectPlayerType : (String -> Msg) -> Html Msg
selectPlayerType onSelection =
  select [ onInput onSelection ]
    [ option [ value "Human" ] [ text "Human" ]
    , option [ value "AI" ] [ text "AI" ]
    ]

