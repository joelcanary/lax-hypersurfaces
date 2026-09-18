import Mathlib.Tactic
import Lax894236.EulerCharacteristic

namespace Lax894236Proofs.EulerCharacteristic

open Finset Lax894236.EulerCharacteristic

/--
---
conclusion: Lax894236.EulerCharacteristic.chiPoly_eq_binomial_tail
---
Expand `(1 - d)^(n+2)` by the binomial theorem and peel off the two lowest
terms, `1` and `-(n+2) d`, which cancel against the rest of `chiPoly`.
-/
theorem chiPoly_eq_binomial_tail (n : ℕ) (d : ℚ) :
    chiPoly n d = ∑ k ∈ range (n + 1), ((n + 2).choose (k + 2) : ℚ) * (-d) ^ (k + 2) := by
  have key : (1 - d) ^ (n + 2)
      = ∑ k ∈ range (n + 3), ((n + 2).choose k : ℚ) * (-d) ^ k := by
    rw [sub_eq_add_neg, add_comm, add_pow]
    apply sum_congr rfl
    intro k _
    rw [one_pow, mul_one]
    ring
  unfold chiPoly
  rw [key, sum_range_succ', sum_range_succ']
  simp [Nat.choose_one_right]

end Lax894236Proofs.EulerCharacteristic
