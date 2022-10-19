defmodule Username do
  def sanitize(''), do: ''

  def sanitize([head | tail]) do
    filtered =
      case head do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        ?_ -> '_'
        head when head in ?a..?z -> [head]
        _ -> ''
      end

    filtered ++ sanitize(tail)
  end
end
