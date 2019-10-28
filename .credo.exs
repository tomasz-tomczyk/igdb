%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ~w{config lib test}
      },
      strict: true,
      color: true,
      checks: [
        {Credo.Check.Readability.MaxLineLength, max_length: 80},
        {Credo.Check.Readability.ParenthesesOnZeroArityDefs, false},
        {Credo.Check.Refactor.MapInto, false}
      ]
    }
  ]
}
