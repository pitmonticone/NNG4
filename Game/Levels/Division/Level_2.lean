import Game.Levels.AdvMultiplication

World "Division"
Level 2
Title "div_refl"

namespace MyNat

Introduction
"
  In this section, we will prove that n ∣ n for any natural number n. In other words, 'divides' is
  a reflexive relation on the natural numebrs.
"

LemmaDoc MyNat.div_refl as "div_refl" in "∣" "
`div_refl x` is a proof that `x ∣ x`.
"

NewLemma MyNat.div_refl

Statement
    (n : ℕ) : n ∣ n := by
  use 1
  rfl

LemmaTab "∣"
