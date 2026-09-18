import Mathlib.Data.Rat.Defs
import Mathlib.Data.Int.Basic

/-!
---
title: The arithmetic obstruction to a linear subspace class being a multiple of the hyperplane power
type: theorem
---
Let $X \subset \mathbb{P}^{2m+1}$ be a smooth hypersurface of degree $d$ and even
dimension $2m$ containing a linear subspace $L \cong \mathbb{P}^m$, and let $h$
be the hyperplane class. Two intersection numbers are standard: $L \cdot h^m = 1$
and $h^m \cdot h^m = d$. If the class of $L$ were a rational multiple
$c\,h^m$, then $c\,d = 1$ and $L \cdot L = c^2 d$ would be an integer, since
intersection numbers of algebraic cycles are integers.

This concept isolates the arithmetic step: for every integer $d \ge 2$ there is
no rational $c$ with $c\,d = 1$ and $c^2 d$ an integer. Hence $[L]$ is not a
rational multiple of $h^m$ for any $d \ge 2$, in every even dimension.
-/

namespace Lax894236.LinearSubspaceClass

/-- For `d ≥ 2` there is no rational `c` with `c d = 1` and `c² d` an integer. -/
axiom no_rational_multiple (d : ℤ) (hd : 2 ≤ d) :
    ¬ ∃ c : ℚ, c * (d : ℚ) = 1 ∧ ∃ n : ℤ, c ^ 2 * (d : ℚ) = (n : ℚ)

end Lax894236.LinearSubspaceClass
