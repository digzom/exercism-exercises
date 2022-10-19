defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    name
    |> String.trim()
    |> first_letter()
    |> String.capitalize()
    |> concat(".")
  end

  defp concat(string1, string2), do: string1 <> string2

  def initials(full_name) do
    [first_name, last_name] = String.split(String.trim(full_name, " "))
    "#{initial(first_name)} #{initial(last_name)}"
  end

  def pair(full_name1, full_name2) do
    pair1 = initials(full_name1)
    pair2 = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{pair1}  +  #{pair2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
