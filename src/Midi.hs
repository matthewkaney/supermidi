import Text.Show.Functions
import Sound.Tidal.Pattern
import Sound.Tidal.Stream

type MidiParam = (String, MidiParamType)

data MidiParamType = CC { pNumber :: Int } |
                     NRPN { pNumber :: Int }
                       deriving Show

-- TODO:         SysEx { pName :: String, pBuilder :: Value -> [Word8] }

midiMap :: [MidiParam] -> [OSC]
midiMap = map paramMap
  where paramMap :: MidiParam -> OSC
        paramMap (name, (CC num)) = OSC "/dirt/play" (ArgList [(name, required)])