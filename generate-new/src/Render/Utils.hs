module Render.Utils
  where

import           Relude
import           Data.Text.Prettyprint.Doc
import           Text.Wrap
import qualified Data.Text                     as T

parenList :: Foldable f => f (Doc ()) -> Doc ()
parenList = genericList (<>) "(" ")"

braceList :: Foldable f => f (Doc ()) -> Doc ()
braceList = genericList (<>) "{" "}"

braceList' :: Foldable f => f (Doc ()) -> Doc ()
braceList' = genericList (<+>) "{" "}"

genericList
  :: Foldable f
  => (Doc () -> Doc () -> Doc ())
  -> Doc ()
  -> Doc ()
  -> f (Doc ())
  -> Doc ()
genericList s l r ds = case toList ds of
  []  -> l <> r
  [d] -> l `s` d `s` r
  _   -> align $ vsep $ zipWith (<+>) (l : repeat ",") (toList ds) <> [r]

appList :: Foldable f => f (Doc ()) -> Doc ()
appList xs = align (vsep (zipWith (<+>) ("<$>" : repeat "<*>") (toList xs)))

-- | Wrap text sensibly
comment :: Text -> Doc ()
comment c =
  let ls = wrapTextToLines defaultWrapSettings 72 c
      prependSpace t = if T.null t then t else " " <> t
  in  vsep $ zipWith (<>) ("-- |" : repeat "--") (pretty . prependSpace <$> ls)

commentNoWrap :: Text -> Doc ()
commentNoWrap c =
  let ls = T.lines c
      prependSpace t = if T.null t then t else " " <> t
  in  vsep $ zipWith (<>) ("-- |" : repeat "--") (pretty . prependSpace <$> ls)

doBlock :: [Doc ()] -> Doc ()
doBlock = \case
  []    -> "pure ()"
  [s]   -> s
  stmts -> "do" <> line <> indent 2 (vsep stmts)

unReservedWord :: Text -> Text
unReservedWord t = if t `elem` (keywords <> preludeWords) then t <> "'" else t
 where
  keywords =
    [ "as"
    , "case"
    , "class"
    , "data family"
    , "data instance"
    , "data"
    , "default"
    , "deriving"
    , "do"
    , "else"
    , "family"
    , "forall"
    , "foreign"
    , "hiding"
    , "if"
    , "import"
    , "in"
    , "infix"
    , "infixl"
    , "infixr"
    , "instance"
    , "let"
    , "mdo"
    , "module"
    , "newtype"
    , "of"
    , "proc"
    , "qualified"
    , "rec"
    , "then"
    , "type"
    , "where"
    ]
  preludeWords = ["filter"]