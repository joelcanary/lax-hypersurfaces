import Mathlib.Tactic
import Lax894236.NoetherLefschetzWindow

namespace Lax894236Proofs.NoetherLefschetzWindow

open Lax894236.GeometricGenus Lax894236.NoetherLefschetzWindow

/--
---
conclusion: Lax894236.NoetherLefschetzWindow.bound_le_pg
---
Induction on `m ≥ 2` with Pascal's rule.
-/
theorem bound_le_pg (m : ℕ) (hm : 2 ≤ m) : m - 2 ≤ pg m 2 := by
  induction m, hm using Nat.le_induction with
  | base => decide
  | succ n hn ih =>
    unfold pg at ih ⊢
    rw [Nat.choose_succ_succ' n 2]
    have h2 : 1 ≤ n.choose 2 := Nat.choose_pos hn
    omega

/--
---
conclusion: Lax894236.NoetherLefschetzWindow.bound_lt_pg
---
The same induction, started at `m = 4`.
-/
theorem bound_lt_pg (m : ℕ) (hm : 4 ≤ m) : m - 2 < pg m 2 := by
  induction m, hm using Nat.le_induction with
  | base => decide
  | succ n hn ih =>
    unfold pg at ih ⊢
    rw [Nat.choose_succ_succ' n 2]
    have h2 : 1 ≤ n.choose 2 := Nat.choose_pos (by omega)
    omega

/--
---
conclusion: Lax894236.NoetherLefschetzWindow.bound_eq_pg_iff
---
-/
theorem bound_eq_pg_iff (m : ℕ) (hm : 2 ≤ m) : m - 2 = pg m 2 ↔ m = 2 ∨ m = 3 := by
  constructor
  · intro heq
    rcases Nat.lt_or_ge m 4 with h4 | h4
    · omega
    · exact absurd heq (by have := bound_lt_pg m h4; omega)
  · rintro (rfl | rfl) <;> decide

/--
---
conclusion: Lax894236.NoetherLefschetzWindow.window_eq_A005581
---
-/
theorem window_eq_A005581 (d : ℤ) :
    (d - 1) * (d - 2) * (d - 3) - 6 * (d - 3) = (d - 4) * (d - 3) * (d + 1) := by
  ring

end Lax894236Proofs.NoetherLefschetzWindow
