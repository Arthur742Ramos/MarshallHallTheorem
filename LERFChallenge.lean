import Mathlib.GroupTheory.Finiteness
import Mathlib.GroupTheory.FreeGroup.Basic

noncomputable section

universe u

namespace LERFChallenge

/-!
# Explicit finite separators for free groups

The selected statement exposes the finite permutation action behind the LERF
consequence.  The implementation constructs the state set from the finite
suffix core of a generating set and the separating word.
-/

structure FinitePermutationSeparator
    {α : Type u} (H : Subgroup (FreeGroup α)) (g : FreeGroup α) where
  State : Type u
  [stateFintype : Fintype State]
  representation : FreeGroup α →* Equiv.Perm State
  base : State
  fixes_subgroup : ∀ h : H, representation (h : FreeGroup α) base = base
  separates : representation g base ≠ base

theorem freeGroup_finite_permutation_separator
    {α : Type*} [Finite α]
    (H : Subgroup (FreeGroup α))
    [Group.FG H]
    (g : FreeGroup α)
    (hg : g ∉ H) :
    Nonempty (FinitePermutationSeparator H g) := by
  sorry

end LERFChallenge
