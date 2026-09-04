import MarshallHall

noncomputable section

namespace LERFChallenge

universe u

structure FinitePermutationSeparator
    {α : Type u} (H : Subgroup (FreeGroup α)) (g : FreeGroup α) where
  State : Type u
  [stateFintype : Fintype State]
  representation : FreeGroup α →* Equiv.Perm State
  base : State
  fixes_subgroup : ∀ h : H, representation (h : FreeGroup α) base = base
  separates : representation g base ≠ base

/-!
# Checked finite separator solution

The selected theorem is obtained from the finite suffix-state completion in
`MarshallHall.Separation`.  The implementation's separator is repackaged at
the Challenge boundary so the Comparator sees the explicit finite action,
not only its finite-index stabilizer corollary.
-/

theorem freeGroup_finite_permutation_separator
    {α : Type*} [Finite α]
    (H : Subgroup (FreeGroup α))
    [Group.FG H]
    (g : FreeGroup α)
    (hg : g ∉ H) :
    Nonempty (FinitePermutationSeparator H g) := by
  obtain ⟨s⟩ := MarshallHall.freeGroup_finite_permutation_separator_proved H g hg
  letI : Fintype s.State := s.stateFintype
  exact ⟨{
    State := s.State
    representation := s.representation
    base := s.base
    fixes_subgroup := s.fixes_subgroup
    separates := s.separates
  }⟩

end LERFChallenge
