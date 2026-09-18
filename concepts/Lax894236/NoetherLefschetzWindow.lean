import Lax894236.GeometricGenus

/-!
---
title: The Noether–Lefschetz window of a surface in ℙ³ and the sequence A005581
type: theorem
---
For a smooth surface of degree $d \ge 3$ in $\mathbb{P}^3$, every component of the
Noether–Lefschetz locus has codimension at least $d - 3$ (Green, Voisin) and at
most $p_g = \binom{d-1}{3}$. The geometry behind the lower bound is taken from
the literature; this concept compares the two bounds as functions of $d$, with
$m = d - 1$ as in `GeometricGenus`.

The first two statements are the inequality $d - 3 \le p_g$ for all $d \ge 3$
and its strictness for $d \ge 5$; the third is the exact case of equality: the
lower bound meets $p_g$ precisely for $d = 3$ and $d = 4$. The last statement
identifies the gap $p_g - (d - 3)$, the "window" between the two bounds, with the
OEIS sequence A005581 evaluated at $d - 3$: as a polynomial identity without
division, $(d-1)(d-2)(d-3) - 6(d-3) = (d-4)(d-3)(d+1)$, where the right-hand side
is six times $A005581(d-3) = \tfrac{(d-4)(d-3)(d+1)}{6}$. It was first observed
numerically for $d \le 200$ and holds for every integer $d$.
-/

namespace Lax894236.NoetherLefschetzWindow

open Lax894236.GeometricGenus

/-- The lower bound `d - 3` never exceeds `p_g` for `d ≥ 3`. -/
axiom bound_le_pg (m : ℕ) (hm : 2 ≤ m) : m - 2 ≤ pg m 2

/-- For `d ≥ 5` the inequality is strict. -/
axiom bound_lt_pg (m : ℕ) (hm : 4 ≤ m) : m - 2 < pg m 2

/-- The lower bound equals `p_g` exactly for `d = 3` and `d = 4`. -/
axiom bound_eq_pg_iff (m : ℕ) (hm : 2 ≤ m) : m - 2 = pg m 2 ↔ m = 2 ∨ m = 3

/-- Six times the window `p_g − (d − 3)` is `(d−4)(d−3)(d+1)`, six times
`A005581(d−3)`, for every integer `d`. -/
axiom window_eq_A005581 (d : ℤ) :
    (d - 1) * (d - 2) * (d - 3) - 6 * (d - 3) = (d - 4) * (d - 3) * (d + 1)

end Lax894236.NoetherLefschetzWindow
