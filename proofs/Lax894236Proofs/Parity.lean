import Mathlib.Tactic
import Lax894236.Parity

namespace Lax894236Proofs.Parity

open Finset Lax894236.Parity

private theorem idem2 : ∀ x : ZMod 2, x * x = x := by decide

/-- In `ZMod 2`, `x ^ j = x` for `j ≥ 1`. -/
private theorem pow_eq_self (x : ZMod 2) (j : ℕ) (hj : 1 ≤ j) : x ^ j = x := by
  induction j with
  | zero => omega
  | succ k ih =>
    rcases Nat.eq_zero_or_pos k with hk | hk
    · subst hk; ring
    · rw [pow_succ, ih hk, idem2]

private theorem neg_one_cast : (-1 : ZMod 2) = 1 := by decide

/-- Modulo `2`, the binomial form of `χ` is `d` times a constant: the sum of the
binomial coefficients from the quadratic term on. -/
private theorem chiBinom_mod2 (n : ℕ) (d : ℤ) :
    ((chiBinom n d : ℤ) : ZMod 2)
      = (d : ZMod 2) * ∑ j ∈ Icc 1 (n + 1), ((n + 2).choose (j + 1) : ZMod 2) := by
  unfold chiBinom
  push_cast
  rw [mul_sum]
  apply sum_congr rfl
  intro j hj
  have hj1 : 1 ≤ j := (mem_Icc.mp hj).1
  rw [neg_one_cast, one_pow, one_mul, pow_eq_self (d : ZMod 2) j hj1]
  ring

/-- The constant is `2^(n+2) - (n+3)`. -/
private theorem tail_sum (n : ℕ) :
    ∑ j ∈ Icc 1 (n + 1), (n + 2).choose (j + 1) = 2 ^ (n + 2) - (n + 3) := by
  have hsum : ∑ i ∈ range (n + 3), (n + 2).choose i = 2 ^ (n + 2) :=
    Nat.sum_range_choose (n + 2)
  have hreindex : ∑ j ∈ Icc 1 (n + 1), (n + 2).choose (j + 1)
      = ∑ i ∈ Icc 2 (n + 2), (n + 2).choose i := by
    apply sum_nbij' (fun j => j + 1) (fun i => i - 1) <;> intros <;> simp_all <;> omega
  rw [hreindex]
  have hsplit : range (n + 3) = insert 0 (insert 1 (Icc 2 (n + 2))) := by
    ext x; simp [mem_range, mem_Icc]; omega
  rw [hsplit] at hsum
  rw [sum_insert (by simp), sum_insert (by simp)] at hsum
  simp [Nat.choose_zero_right, Nat.choose_one_right] at hsum
  omega

/-- For odd `n` the constant is even. -/
private theorem tail_sum_even (n : ℕ) (hn : Odd n) :
    (∑ j ∈ Icc 1 (n + 1), ((n + 2).choose (j + 1) : ZMod 2)) = 0 := by
  rw [show (∑ j ∈ Icc 1 (n + 1), ((n + 2).choose (j + 1) : ZMod 2))
      = ((∑ j ∈ Icc 1 (n + 1), (n + 2).choose (j + 1) : ℕ) : ZMod 2) from by
    push_cast; ring]
  rw [ZMod.natCast_eq_zero_iff_even, tail_sum]
  have hle : n + 3 ≤ 2 ^ (n + 2) := by
    have := Nat.lt_two_pow_self (n := n + 2)
    omega
  rw [Nat.even_sub hle]
  have hn3 : Even (n + 3) := by obtain ⟨k, hk⟩ := hn; exact ⟨k + 2, by omega⟩
  constructor
  · intro _; exact hn3
  · intro _; exact ⟨2 ^ (n + 1), by ring⟩

/--
---
conclusion: Lax894236.Parity.two_dvd_chiBinom_of_odd
---
In `ZMod 2` every power `d^j` with `j ≥ 1` equals `d`, so `χ` reduces to `d`
times the sum of the binomial coefficients from the quadratic term on, which is
`2^(n+2) − (n+3)`: even when `n` is odd.
-/
theorem two_dvd_chiBinom_of_odd (n : ℕ) (hn : Odd n) (d : ℤ) : (2 : ℤ) ∣ chiBinom n d := by
  have h2 : ((2 : ℕ) : ℤ) ∣ chiBinom n d := by
    rw [← ZMod.intCast_zmod_eq_zero_iff_dvd, chiBinom_mod2, tail_sum_even n hn, mul_zero]
  exact_mod_cast h2

/--
---
conclusion: Lax894236.Parity.two_dvd_b3
---
-/
theorem two_dvd_b3 (d : ℤ) : (2 : ℤ) ∣ (4 - chiBinom 3 d) := by
  obtain ⟨r, hr⟩ := two_dvd_chiBinom_of_odd 3 ⟨1, rfl⟩ d
  exact ⟨2 - r, by omega⟩

/-- `2x³ − 6x² + 7x = 0` for every `x` in `ZMod 3`, by finite check. -/
private theorem h11Num_mod3 : ∀ x : ZMod 3, 2 * x ^ 3 - 6 * x ^ 2 + 7 * x = 0 := by decide

/--
---
conclusion: Lax894236.Parity.three_dvd_h11Num
---
Reduce modulo `3` and check the three residues.
-/
theorem three_dvd_h11Num (d : ℤ) : (3 : ℤ) ∣ h11Num d := by
  have h3 : ((h11Num d : ℤ) : ZMod 3) = 0 := by
    unfold h11Num; push_cast; exact h11Num_mod3 (d : ZMod 3)
  exact_mod_cast (ZMod.intCast_zmod_eq_zero_iff_dvd (h11Num d) 3).mp h3

/--
---
conclusion: Lax894236.Parity.betti_relation
---
-/
theorem betti_relation (d : ℤ) :
    3 * (d ^ 3 - 4 * d ^ 2 + 6 * d) = 6 + (d - 1) * (d - 2) * (d - 3) + h11Num d := by
  unfold h11Num; ring

end Lax894236Proofs.Parity
