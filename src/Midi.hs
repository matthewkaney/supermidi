import Text.Show.Functions
import Sound.Tidal.Pattern
import Sound.Tidal.Stream

type MidiParam = (String, MidiParamType)

data MidiParamType = CC { pNumber :: Int }
                   | NRPN { pNumber :: Int }
                   | SysEx (Value -> Maybe [Word8])
                   | Mapped MidiParamType (Value -> Maybe Value)
                       deriving Show   

midiMap :: [MidiParam] -> [OSC]
midiMap = map paramMap
  where paramMap :: MidiParam -> OSC
        paramMap (name, (CC num)) = OSC "/dirt/play" (ArgList [(name, required)])