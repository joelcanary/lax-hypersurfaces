import Mathlib.Tactic
import Lax894236.LinearSubspaceClass

namespace Lax894236Proofs.LinearSubspaceClass

/--
---
conclusion: Lax894236.LinearSubspaceClass.no_rational_multiple
---
From `c d = 1`, `c = 1/d`; then `c² d = 1/d`, and `n d = 1` in `ℤ` forces
`d ∣ 1`, impossible for `d ≥ 2`.
-/
theorem no_rational_multiple (d : ℤ) (hd : 2 ≤ d) :
    ¬ ∃ c : ℚ, c * (d : ℚ) = 1 ∧ ∃ n : ℤ, c ^ 2 * (d : ℚ) = (n : ℚ) := by
  rintro ⟨c, hcd, n, hn⟩
  have hd0 : (d : ℚ) ≠ 0 := by
    have : (0 : ℤ) < d := by omega
    exact_mod_cast this.ne'
  have hc : c = 1 / d := by
    field_simp
    linarith [hcd]
  rw [hc] at hn
  have hn' : (n : ℚ) * d = 1 := by
    field_simp at hn
    linarith [hn]
  have hnd : n * d = 1 := by exact_mod_cast hn'
  have hddvd : d ∣ 1 := ⟨n, by linarith [hnd, mul_comm n d]⟩
  have := Int.le_of_dvd (by norm_num) hddvd
  omega

end Lax894236Proofs.LinearSubspaceClass
