defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @protein %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }

  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    protein_list = rna
    |> to_charlist
    |> turn_into_rna
    |> Enum.map(fn(strand) ->
      turn_to_protein(strand)
    end)
    |> extract_protein

    if is_list(protein_list) do
      {:ok, protein_list}
    else
      protein_list
    end
  end


  @spec of_codon(String.t()) :: { atom, String.t() }

  def of_codon(codon) do
    codon
    |> to_charlist
    |> turn_into_rna
    |> turn_to_protein
  end


  defp turn_into_rna([]), do: []
  defp turn_into_rna([a, b, c | tail]) do
    [[a, b, c] | turn_into_rna(tail)]
  end
  defp turn_into_rna([_head | _tail]), do: []

  defp turn_to_protein(rna) do
    rna_word = rna |> to_string
    cond do
      Map.has_key?(@protein, rna_word) == true ->
        {:ok, Map.get(@protein, rna_word)}
      Map.has_key?(@protein, rna_word) == false ->
        {:error, "invalid codon"}
    end
  end


  defp extract_protein([]), do: []
  defp extract_protein([{:error, _ } | _tail]) do
    {:error, "invalid RNA"}
  end
  defp extract_protein([{:ok, "STOP"} | _ ]), do: []
  defp extract_protein([{:ok, protein } | tail]) do
    [protein | extract_protein(tail)]
  end

end

