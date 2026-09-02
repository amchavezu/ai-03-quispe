import Mathlib

/-!
# Paper-Facing Theorems: Agentic Delegation and the Language Frontier of Software Developers

This file is the implementation theorem layer for the source paper. Keep
source-faithful definitions and theorem wrappers here, and expose only the
compact human-review subset in `PaperInterface.lean`.

During the statement-first phase, each exact paper-facing proposition lives in a
transparent `<name>Spec : Prop` declaration in `PaperInterface.lean`; the paired
theorem/lemma endpoint belongs in `ProofInterface.lean` and has exactly that
type. Add proof implementations here only after those specifications pass v11
raw-source-to-expanded-Spec review and recursive premise provenance audit. Before full closeout, the v11
realization audit independently binds pinned source atoms to the elaborated Spec
and accounts for the complete Lean closure; a proof hole or a declaration name
is never evidence for that correspondence.
-/

namespace QX26AgenticDelegation

/-- The strict part of the printed Proposition 3, with its printed upper endpoint. -/
def dynamicCumulativeLanguageEffectPrintedStrictClaim : Prop :=
  ∀ (K : Type) [Fintype K] [Nonempty K] (p₂ : K → ℝ),
    (∀ k, 0 < p₂ k ∧ p₂ k ≤ 1) →
      (let G := fun n : ℕ => ∑ k, (1 - (1 - p₂ k) ^ n)
       (∀ n, G (n + 1) < G (n + 2)) ∧
         ∀ n, G (n + 2) - G (n + 1) < G (n + 1) - G n)

/-- At `p₂ = 1`, the cumulative gap saturates after one period, so strict growth fails. -/
theorem dynamicCumulativeLanguageEffectPrintedEndpointCounterexample :
    ¬ dynamicCumulativeLanguageEffectPrintedStrictClaim := by
  intro h
  have hUnit := h Unit (fun _ => 1) (by
    intro k
    constructor <;> norm_num)
  rcases hUnit with ⟨hIncreasing, _⟩
  have hFalse := hIncreasing 0
  norm_num at hFalse

end QX26AgenticDelegation
