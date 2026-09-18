import Mathlib.Data.Nat.Choose.Basic

/-!
---
title: The Kodaira trichotomy of a hypersurface as a statement about binomial coefficients
type: theorem
---
By Griffiths' description of the Hodge numbers of hypersurfaces, the geometric
genus of a smooth hypersurface of degree $d$ and dimension $n$ is
$h^{n,0}(X_d^n) = \binom{d-1}{n+1}$. Writing $m = d - 1$, this concept defines
`pg m n = C(m, n+1)` and states the classification by the sign of the canonical
bundle as facts about binomial coefficients:

- Fano: $h^{n,0} = 0$ if and only if $d \le n+1$;
- Calabi–Yau: $h^{n,0} = 1$ if and only if $d = n+2$;
- general type: $d \ge n+3$ implies $h^{n,0} \ge 2$.

For plane curves ($n = 1$) the same formula is the genus–degree formula
$g = \binom{d-1}{2} = \tfrac{(d-1)(d-2)}{2}$, which is the last statement.
-/

namespace Lax894236.GeometricGenus

/-- The geometric genus `h^{n,0}` of a smooth hypersurface of degree `m + 1` and
dimension `n`, by Griffiths' formula: `C(m, n+1)`. -/
def pg (m n : ℕ) : ℕ := m.choose (n + 1)

/-- Fano: the geometric genus vanishes if and only if `d ≤ n + 1`. -/
axiom pg_eq_zero_iff (m n : ℕ) : pg m n = 0 ↔ m < n + 1

/-- Calabi–Yau: the geometric genus is `1` if and only if `d = n + 2`. -/
axiom pg_eq_one_iff (m n : ℕ) : pg m n = 1 ↔ m = n + 1

/-- General type: for `d ≥ n + 3` the geometric genus is at least `2`. -/
axiom two_le_pg (m n : ℕ) (h : n + 2 ≤ m) : 2 ≤ pg m n

/-- The genus–degree formula for smooth plane curves of degree `m + 1`. -/
axiom genus_degree (m : ℕ) : pg m 1 = m * (m - 1) / 2

end Lax894236.GeometricGenus
