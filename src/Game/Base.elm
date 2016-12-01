module Game.Base exposing (initialState, update, view, Model, Msg, startGame)

import Html exposing (Html)

import Game.Player exposing (..)
import Game.Player exposing (PlayerType(..))
import Game.Player exposing (Team(..))
import Game.BoardRenderer as BoardRenderer
import Game.Board as Board
import Game.Board exposing (Board)

import Debug

type GameState
  = Stopped
  | Turn Player
  | Winner Player

type alias Model =
  { gameState : GameState
  , player1 : Player
  , player2 : Player
  , board : Board
  }

type Msg
  = StartGame Player Player
  | BoardMsg BoardRenderer.Msg

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
    BoardMsg boardMsg ->
      (model, Cmd.none)

view : Model -> Html Msg
view model =
  Html.map BoardMsg (BoardRenderer.render model.board)

initialState : Model
initialState =
  { gameState = Stopped
  , player1 = Player None Cross
  , player2 = Player None Circle
  , board = Board.initFiveByFive
  }

startGame : String -> String -> Msg
startGame player1type player2type =
  let
    player1 = Player (playerType player1type) Cross
    player2 = Player (playerType player2type) Circle
  in
    StartGame player1 player2

-- private

playerType : String -> PlayerType
playerType stringPlayerType =
  case stringPlayerType of
    "Human" -> Human
    "AI" -> AI
    _ -> Debug.crash "not supported you dingus"
