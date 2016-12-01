module Game.Base exposing (initialState, update, view, Model, Msg, startGame)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)

import Game.Player exposing (..)
import Game.Player exposing (PlayerType(..))

import Debug

type GameState
  = Stopped
  | Turn Player
  | Winner Player

type alias Model =
  { gameState : GameState
  , player1 : Player
  , player2 : Player
  }

type Msg
  = StartGame Player Player

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    StartGame player1 player2 ->
      let
        newModel =
          { model |
            gameState = Turn player1
          , player1 = player1
          , player2 = player2
          }
      in
        (newModel, Cmd.none)

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
  , player1 = Player None 0
  , player2 = Player None 0
  }

startGame : String -> String -> Msg
startGame player1type player2type =
  let
    player1 = Player (playerType player1type) 1
    player2 = Player (playerType player2type) 2
  in
    StartGame player1 player2

-- private

playerType : String -> PlayerType
playerType stringPlayerType =
  case stringPlayerType of
    "Human" -> Human
    "AI" -> AI
    _ -> Debug.crash "not supported you dingus"
