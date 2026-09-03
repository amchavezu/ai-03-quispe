import QX26AgenticDelegation.MainTheorems

/-!
# Paper Assumptions: Agentic Delegation and the Language Frontier of Software Developers

This file is the only paper-local place for assumptions that are not derived in
Lean. Keep it small. Each declaration must be explicitly stated by the paper,
listed in `status.json` `review_surface.assumption_names`, and judged in
`audit/assumption_match_llm.json` as a true source/model assumption rather than a
proof convenience.

Use `-- audit-premise: <exact Lean binder>` comments to route hidden theorem
premises to an approved assumption declaration when the audit reports an exact
binder string.

Start empty. Add a proposition here only after locating it as a literal source
antecedent. Never move an unproved lemma or target conclusion here merely to
make a statement skeleton compile.
-/

/-!
# Source assumptions

Transparent predicates corresponding to the three numbered assumptions in the
paper.  They introduce no axioms: theorem endpoints either expand them directly
or use the exact consequence stated in their signatures.
-/

namespace QX26AgenticDelegation

/-- Assumption 1: augmentation has nonpositive unfamiliar net value and positive familiar net value. -/
def augmentationRequiresFoothold (unfamiliarNet familiarNet : ℝ) : Prop :=
  unfamiliarNet ≤ 0 ∧ 0 < familiarNet

/-- Assumption 2: the five printed verification/residual-error derivatives have the stated signs. -/
def verificationTechnology
    (κa κs residualA residualS residualCapability : ℝ) : Prop :=
  κa < 0 ∧ κs ≤ 0 ∧ residualA ≤ 0 ∧ residualS ≤ 0 ∧ residualCapability ≤ 0

/-- Assumption 3: a common nonnegative activation increment that is weakly increasing in ability. -/
def comparableUnfamiliarLanguageCandidates
    (A : Type) [Preorder A] (p : A → ℝ) : Prop :=
  (∀ a, 0 ≤ p a) ∧ Monotone p

end QX26AgenticDelegation
