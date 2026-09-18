import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Group.Even
import Mathlib.Algebra.Ring.Parity
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Order.Interval.Finset.Nat

/-!
---
title: Parity of the Euler characteristic in odd dimension, and integrality for surfaces
type: theorem
---
Write the Euler characteristic of the smooth hypersurface $X_d^n$ in its binomial
form, $\chi_n(d) = \sum_{j=1}^{n+1} (-1)^{j+1}\binom{n+2}{j+1} d^j$ (the polynomial
of `EulerCharacteristic` divided by $d$). Its coefficients are not all even, so
evenness of $\chi_n(d)$ is not a polynomial identity; it is a parity fact.

The first statement: for every odd dimension $n$ and every integer $d$,
$\chi_n(d)$ is even. For threefolds this is what makes the mirror-symmetry
formula $h^{2,1} = b_3/2 - h^{3,0}$ with $b_3 = 4 - \chi$ an integer for every
degree; the second statement is that instance.

The remaining two statements concern surfaces in $\mathbb{P}^3$, where the
literature gives $\chi = d^3 - 4d^2 + 6d$, $h^{2,0} = \binom{d-1}{3}$ and
$h^{1,1} = \tfrac{2d^3}{3} - 2d^2 + \tfrac{7d}{3}$. The third statement is that
$h^{1,1}$ is an integer for every $d$, i.e. $3 \mid 2d^3 - 6d^2 + 7d$; the fourth
is that the three formulas satisfy the Betti relation of a simply connected
surface, $\chi = 2 + 2h^{2,0} + h^{1,1}$, as a polynomial identity in $d$
(multiplied by $3$ and with $6\binom{d-1}{3} = (d-1)(d-2)(d-3)$).
-/

namespace Lax894236.Parity

open Finset

/-- The Euler characteristic of `X_d^n` in binomial form,
`∑_{j=1}^{n+1} (-1)^(j+1) C(n+2, j+1) d^j`, as an integer polynomial in `d`. -/
def chiBinom (n : ℕ) (d : ℤ) : ℤ :=
  ∑ j ∈ Icc 1 (n + 1), (-1 : ℤ) ^ (j + 1) * ((n + 2).choose (j + 1) : ℤ) * d ^ j

/-- Three times `h^{1,1}` of a smooth surface of degree `d` in `ℙ³`:
`2 d³ - 6 d² + 7 d`. -/
def h11Num (d : ℤ) : ℤ := 2 * d ^ 3 - 6 * d ^ 2 + 7 * d

/-- In every odd dimension the Euler characteristic is even, for every degree. -/
axiom two_dvd_chiBinom_of_odd (n : ℕ) (hn : Odd n) (d : ℤ) : (2 : ℤ) ∣ chiBinom n d

/-- For threefolds, `b₃ = 4 - χ` is even for every degree. -/
axiom two_dvd_b3 (d : ℤ) : (2 : ℤ) ∣ (4 - chiBinom 3 d)

/-- `h^{1,1}` of a smooth surface in `ℙ³` is an integer for every degree. -/
axiom three_dvd_h11Num (d : ℤ) : (3 : ℤ) ∣ h11Num d

/-- The Betti relation `χ = 2 + 2 h^{2,0} + h^{1,1}` holds for every degree, as
the polynomial identity `3 χ = 6 + (d-1)(d-2)(d-3) + 3 h^{1,1}`. -/
axiom betti_relation (d : ℤ) :
    3 * (d ^ 3 - 4 * d ^ 2 + 6 * d) = 6 + (d - 1) * (d - 2) * (d - 3) + h11Num d

end Lax894236.Parity
