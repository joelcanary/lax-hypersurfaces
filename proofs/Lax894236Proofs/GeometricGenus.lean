import Mathlib.Tactic
import Lax894236.GeometricGenus

namespace Lax894236Proofs.GeometricGenus

open Lax894236.GeometricGenus

/--
---
conclusion: Lax894236.GeometricGenus.pg_eq_zero_iff
---
-/
theorem pg_eq_zero_iff (m n : ℕ) : pg m n = 0 ↔ m < n + 1 := by
  unfold pg; exact Nat.choose_eq_zero_iff

/--
---
conclusion: Lax894236.GeometricGenus.pg_eq_one_iff
---
-/
theorem pg_eq_one_iff (m n : ℕ) : pg m n = 1 ↔ m = n + 1 := by
  unfold pg
  constructor
  · intro h; rcases Nat.choose_eq_one_iff.mp h with h0 | h1 <;> omega
  · intro h; subst h; simp [Nat.choose_self]

/--
---
conclusion: Lax894236.GeometricGenus.two_le_pg
---
`C(n+2, n+1) = n + 2 ≥ 2`, and `C(·, n+1)` is monotone.
-/
theorem two_le_pg (m n : ℕ) (h : n + 2 ≤ m) : 2 ≤ pg m n := by
  unfold pg
  have hval : (n + 2).choose (n + 1) = n + 2 := by
    have hs := (Nat.choose_symm (show n + 1 ≤ n + 2 by omega)).symm
    rw [show (n + 2) - (n + 1) = 1 by omega, Nat.choose_one_right] at hs
    exact hs
  have hmono := Nat.choose_le_choose (n + 1) h
  omega

/--
---
conclusion: Lax894236.GeometricGenus.genus_degree
---
-/
theorem genus_degree (m : ℕ) : pg m 1 = m * (m - 1) / 2 := by
  unfold pg; exact Nat.choose_two_right m

end Lax894236Proofs.GeometricGenus
