# ChickenEggOrder

A small Lean 4 project that formalizes a simple chicken-and-egg ordering
problem.

The model assumes a causal world where chickens lay eggs, eggs hatch chickens,
and the `before` relation is strict and transitive. Under these assumptions,
the project proves that neither chickens nor eggs can be first as a class:

- `not_ChickenFirst`: no chicken precedes every egg.
- `not_EggFirst`: no egg precedes every chicken.
- `both_not_first`: both conclusions hold together.

## Build

```sh
lake build
```

## Run

```sh
lake exe chickeneggorder
```

## Files

- `ChickenEggOrder/Basic.lean`: world structures and causal assumptions.
- `ChickenEggOrder/Questions.lean`: definitions of `ChickenFirst` and
  `EggFirst`.
- `ChickenEggOrder/FinalTheorems.lean`: final Lean proofs.

## License

MIT
