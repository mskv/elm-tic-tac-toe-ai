module Game.Player exposing (PlayerType, PlayerId, Player)

type PlayerType
  = AI
  | Human

type alias PlayerId =
  Int

type alias Player =
  { playerType : PlayerType
  , playerId : PlayerId
  }
