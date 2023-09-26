import Game.Metadata
import Game.MyNat.Multiplication


World "Tutorial"
Level 2
Title "the rw tactic"

Introduction
"
In this level we're going to prove the theorem $2y=2(x+7)$, assuming only that $y=x+7$.

In this level the *goal* is `2 * y = 2 * (x + 7)` but to help us we're going to
have the *assumption* that `y = x + 7`. The name of the assumption is `h`. Lean
thinks of `h` as being a *proof* of the assumption.

Before we can use `rfl`, we have to \"substitute in for $y$\".
We do this in Lean by *rewriting* the proof `h`,
using the `rw` tactic.
"

/-- If $x$ and $y$ are natural numbers, and $y = x + 7$, then $2y = 2(x + 7)$. -/
Statement
    (x y : ℕ) (h : y = x + 7) : 2 * y = 2 * (x + 7) := by
  Hint "You can execute `rw [h]` to replace the `y` with `x + 7`."
  rw [h]
  Hint (hidden := true) "Now `rfl` will work."
  rfl

TacticDoc rw "
## Summary

If `h` is a proof of `X = Y`, then `rw [h]` will change
all `X`s in the goal to `Y`s.

## Variants

* `rw [←h]` (changes `Y`s to `X`s; get the back arrow by typing `\\left ` or `\\l `.)

* `rw [h1, h2]` (a sequence of rewrites)

* `rw [h] at h2` (changes `X`s to `Y`s in hypothesis `h2`)

* `rw [h] at h1 h2 ⊢` (changes `X`s to `Y`s in two hypotheses and the goal;
get the `⊢` symbol with `\\|-`.)


## Details

The `rw` tactic is a way to do \"substituting in\". There
are two distinct situations where you can use this tactic.

1) Basic usage: if `h : A = B` is an assumption or
the proof of a theorem, and if the goal contains one or more `A`s, then `rw [h]`
will change them all to `B`'s. The tactic will error
if there are no `A`s in the goal.

2) Advanced usage: Assumptions coming from theorem proofs
often have missing pieces. For example `add_zero`
is a proof that `? + 0 = ?` because `add_zero` really is a function,
and we didn't give it enough inputs yet.
In this situation `rw` will look through the goal
for any subterm of the form `x + 0`, and the moment it
finds one it fixes `?` to be `x` then changes all `x + 0`s to `x`s.

Exercise: think about why `rw [add_zero]` changes the term
`(0 + 0) + (x + 0) + (0 + 0) + (x + 0)` to
`0 + (x + 0) + 0 + (x + 0)`

If you can't remember the name of the proof of an equality, look it up in
the list of lemmas on the right.

## Targetted usage

If your goal is `a + b + c = b + (a + c)` and you want to rewrite `a + b`
to `b + a`, then `rw [add_comm]` will not work because Lean finds another
addition first and rewrites that instead. Use `rw [add_comm a b]` to guarantee
that Lean rewrites `a + b` to `b + a`.

## Common errors

* You need the square brackets. `rw h` is never correct.

* If `h` is not a proof of the form `A = B`
or `A ↔ B` (for example if `h` is a function, an implication,
or perhaps even a proposition itself rather than its proof),
then `rw` is not the tactic you want to use. For example,
`rw [P = Q]` is never correct: `P = Q` is the theorem *statement*,
not the proof. If `h : P = Q` is the proof, then `rw [h]` will work.

### Example:

If you have the assumption `h : x = y + y` and your goal is
```
succ (x + 0) = succ (y + y)
```

then

`rw [add_zero]`

will change the goal into `succ x = succ (y + y)`, and then

`rw [h]`

will change the goal into `succ (y + y) = succ (y + y)`, which
can be solved with `rfl`..

### Example:

You can use `rw` to change a hypothesis as well.
For example, if you have two hypotheses
```
h1 : x = y + 3
h2 : 2 * y = x
```
then `rw [h1] at h2` will turn `h2` into `h2 : 2 * y = y + 3`.
-/
"

NewTactic rw

Conclusion
"
You can now press on by clicking \"Next\", but if you want to inspect the
proof you just created, toggle \"Editor mode\" by clicking
on the `</>` button in the top right. In editor mode,
you can click or move your cursor around the proof to see the state of Lean's brain at any point.
If you want to go back to the default (command line) mode with hints,
click the button again (it now displays `>_`).

In editor mode, note that each tactic is written on a new line and Lean is sensitive
to indentation (i.e. there must be no spaces before any of the tactics).
"
