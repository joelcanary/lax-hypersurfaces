import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Rat.Defs

/-!
---
title: The Euler characteristic of a smooth hypersurface as a binomial tail
type: theorem
---
For a smooth hypersurface $X_d^n \subset \mathbb{P}^{n+1}$ of degree $d$ and
dimension $n$, the topological Euler characteristic is the polynomial in $d$

$$\chi(X_d^n) = \frac{(1-d)^{n+2} - 1}{d} + (n+2),$$

a consequence of the Hirzebruch–Riemann–Roch computation of the Chern classes of a
hypersurface. That geometric input is taken from the literature; this concept is
about the polynomial itself. Multiplying by $d$ removes the division:
`chiPoly n d = (1 - d)^(n+2) - 1 + (n+2) d`.

The statement is that this polynomial equals the tail of the binomial expansion
of $(1-d)^{n+2}$ from the quadratic term on,
$\sum_{k=0}^{n} \binom{n+2}{k+2} (-d)^{k+2}$: the constant and linear terms of
the binomial cancel against $-1$ and $(n+2)d$, which is why $\chi$ is a genuine
polynomial with no constant or linear term. The familiar cases are
$d^3 - 4d^2 + 6d$ for surfaces and $10d - 10d^2 + 5d^3 - d^4$ for threefolds.
-/

namespace Lax894236.EulerCharacteristic

open Finset

/-- `d` times the Euler characteristic of a smooth degree-`d` hypersurface of
dimension `n`: the polynomial `(1 - d)^(n+2) - 1 + (n+2) d`. -/
def chiPoly (n : ℕ) (d : ℚ) : ℚ := (1 - d) ^ (n + 2) - 1 + ((n : ℚ) + 2) * d

/-- The polynomial equals the binomial tail
`∑_{k=0}^{n} C(n+2, k+2) (-d)^(k+2)`. -/
axiom chiPoly_eq_binomial_tail (n : ℕ) (d : ℚ) :
    chiPoly n d = ∑ k ∈ range (n + 1), ((n + 2).choose (k + 2) : ℚ) * (-d) ^ (k + 2)

end Lax894236.EulerCharacteristic
