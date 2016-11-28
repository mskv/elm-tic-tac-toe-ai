module Game.Base exposing (initialState, update, view, Model, Msg, startGame)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)

import Game.Player exposing (..)

type GameState
  = Stopped
  | Turn Player
  | Winner Player

type alias Model =
  { gameState : GameState
  }

type Msg
  = StartGame Player Player

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  (model, Cmd.none)

view : Model -> Html Msg
view model =
  case model.gameState of
    Stopped ->
      Svg.rect [ width "50", height "100" ] []
    _ ->
      Svg.rect [ width "100", height "100" ] []

initialState : Model
initialState =
  { gameState = Stopped
  }

startGame : Player -> Player -> Msg
startGame player1 player2 =
  StartGame player1 player2

-- private
