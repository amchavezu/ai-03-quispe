import QX26AgenticDelegation.MainTheorems
import QX26AgenticDelegation.Assumptions

/-!
# Human-Facing Paper Interface: Agentic Delegation and the Language Frontier of Software Developers

This is the compact Lean file a human should read after formalization to check
whether the paper's definitions and named theorem statements were represented
correctly. Keep the row-level dashboard and LLM audit statements in this file
for every paper. Move implementation details, proof aliases, and bulky helper
lemmas behind imported modules such as `AuditInterface.lean`, but expose the
audited paper-facing statements directly here; do not use
`paper_interface.audit_surface_path`.

Rules for completing this file:

- Keep the paper's definitions/formatted objects first, in source order.
- Expose the actual paper formulas here; do not only point to generic library
  definitions or implementation witnesses.
- A material reusable `EconCSLib` primitive may remain a reference here only
  after `audit/library_semantic_review.json` records its exact bounded library
  declaration and an explicit byte-pinned paper-source connection. The
  dashboard and human-review packet show and source-check that declaration
  before the dependent Spec; a library name, docstring, or glossary is not a
  semantic bridge. Do not add a duplicate paper claim merely to restate it.
- If a named theorem needs a hypothesis that is not derived from earlier Lean
  declarations, declare that hypothesis in `Assumptions.lean` and list it in
  `status.json` `review_surface.assumption_names`.
- Then state the named results directly, with assumptions visible in each
  theorem signature by referencing named paper assumptions imported from
  `Assumptions.lean`.
- In the statement-first phase, write every complete source-facing statement as
  a transparent `<name>Spec : Prop` here, exactly once. Put the paired
  theorem/lemma of that exact type in `ProofInterface.lean`. This separation keeps
  the human semantic surface free of thin wrapper declarations.
- Before drafting that Lean surface, independently inventory every material
  source atom from exact pinned source quote bytes. Do not infer source atoms
  from declaration, binder, field, function, or source-map names.
- Run raw-source-to-expanded-Spec statement matching plus recursive
  premise/conclusion provenance on the skeleton. The semantic comparison uses
  only byte-pinned source quotes (and separately pinned source context) against
  the expanded transparent Spec; map summaries and proof wrappers are not
  semantic inputs. Then freeze each canonical Lean declaration-manifest digest.
- In the proof phase, complete the `ProofInterface.lean` body with a short
  proof that calls into `MainTheorems.lean` or lower proof files without
  changing the specification or theorem type. Any specification/type change
  invalidates the freeze and requires a fresh statement audit.
- At formalized closeout, complete the v11 realization receipt: Lean Meta checks
  the theorem has exactly the transparent Spec type; each source atom is bound
  to the elaborated Spec surface; closure traversal includes proof and instance
  arguments; and every material terminal has a source, approved correction or
  additional assumption, checked derivation, or version-pinned foundation
  disposition. No data, container, or identifier-based exemption is allowed.
- The transparent `...Spec` is the sole semantic-review target for its source
  claim. The paired theorem/lemma is a proof endpoint whose exact Spec type is
  verified by Lean Meta, not a duplicate source-to-Lean comparison row.
- Keep proof endpoints, exhaustive endpoint aliases, and proof-seam checks in
  `ProofInterface.lean`, implementation modules, or `ProofLedger.lean`, not
  here. Do not create new `PostPaperAudit.lean` or `AuditLedger.lean` files;
  those names are legacy.

## Named Results

Each entry has one semantic-review target (`Spec`) and one proof endpoint (the
paired theorem/lemma). The human dashboard and review packet present that pair
once rather than treating the two declarations as duplicate paper claims.

- `frontierExpansionSpec` -> `frontierExpansion`: Proposition 1 (Frontier expansion), Section 4.2, p. 15.
- `activationBandUnfamiliarSpec` -> `activationBandUnfamiliar`: Proposition 2 (Activation band for unfamiliar languages), Section 4.2, pp. 15–16.
- `dynamicCumulativeLanguageEffectCorrectedSpec` -> `dynamicCumulativeLanguageEffectCorrected`: Proposition 3 (Dynamic cumulative-language effect), corrected strict version, Section 4.3, p. 17.
- `specialistAbilityHeterogeneitySpec` -> `specialistAbilityHeterogeneity`: Proposition 4 (Specialist and ability heterogeneity), Appendix B.2, pp. 62–63.
- `repositoryExpansionSpec` -> `repositoryExpansion`: Proposition 5 (Repository expansion), Appendix B.3, p. 65.
-/

namespace QX26AgenticDelegation

/--
Proposition 1 (Frontier expansion)

Paper statement: For any realization of developer-language values, lowering the effective threshold for agentic delegation weakly expands the set (and hence the number) of languages in which the developer is active.

Source location: Section 4.2, p. 15
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def frontierExpansionSpec : Prop :=
  ∀ (K : Type) [Fintype K] (vS vC vD : K → ℝ),
    (let V₁ := fun k => max (vS k) (vC k)
     let V₂ := fun k => max (V₁ k) (vD k)
     let Z := fun V => if 0 ≤ V then (1 : ℕ) else 0
     (∀ k, Z (V₁ k) ≤ Z (V₂ k)) ∧
       (∑ k, Z (V₁ k)) ≤ ∑ k, Z (V₂ k))

/--
Proposition 2 (Activation band for unfamiliar languages)

Paper statement: For an unfamiliar language, agentic delegation activates the language exactly when the delegation threshold lies in the half-open interval [T^D,T^S). Consequently, the expected expansion equals the sum across languages of the associated CDF differences and is nonnegative.

Source location: Section 4.2, pp. 15–16
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def activationBandUnfamiliarSpec : Prop :=
  ∀ (K : Type) [Fintype K]
      (TD TS T₁ B : K → ℝ) (F : K → ℝ → ℝ),
    (∀ k, T₁ k = TS k) →
    (∀ k, B k = TS k - TD k) →
    (∀ k, 0 < B k) →
    (∀ k, Monotone (F k)) →
    (∀ k, Continuous (F k)) →
    (let zD := fun τ k => if TD k ≤ τ then (1 : ℕ) else 0
     let z₁ := fun τ k => if T₁ k ≤ τ then (1 : ℕ) else 0
     (∀ k τ, zD τ k - z₁ τ k =
       if TD k ≤ τ ∧ τ < TS k then 1 else 0) ∧
       0 ≤ ∑ k, (F k (TS k) - F k (TD k)))

/--
Proposition 3 (Dynamic cumulative-language effect), corrected strict version

Paper statement: The printed proposition assumes p1 = 0 < p2 and states that the cumulative language gap is strictly increasing and strictly concave over time. The endpoint p2 = 1 makes those strict claims false after immediate saturation. This target preserves the weak conclusion on the printed domain and states the strict conclusions under the necessary additional condition p2 < 1; the printed claim is archived and refuted separately.

Source location: Section 4.3, p. 17
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def dynamicCumulativeLanguageEffectCorrectedSpec : Prop :=
  ∀ (K : Type) [Fintype K] [Nonempty K] (p₁ p₂ : K → ℝ),
    (∀ k, 0 ≤ p₁ k ∧ p₁ k ≤ p₂ k ∧ p₂ k ≤ 1) →
    (let G := fun s : ℕ =>
       ∑ k, ((1 - p₁ k) ^ (s + 1) - (1 - p₂ k) ^ (s + 1))
     (∀ s, 0 ≤ G s) ∧
       ((∀ k, p₁ k = 0 ∧ 0 < p₂ k ∧ p₂ k < 1) →
         (∀ s, G s < G (s + 1)) ∧
           ∀ s, G (s + 2) - G (s + 1) < G (s + 1) - G s))

/--
Proposition 4 (Specialist and ability heterogeneity)

Paper statement: Expected language expansion is weakly larger for developers with more unfamiliar candidate languages and for developers with greater ability, when ability weakly raises the activation probability.

Source location: Appendix B.2, pp. 62–63
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def specialistAbilityHeterogeneitySpec : Prop :=
  ∀ (A : Type) [Preorder A] (p : A → ℝ),
    comparableUnfamiliarLanguageCandidates A p →
    (let E := fun (U : ℕ) (a : A) => (U : ℝ) * p a
     ∀ U₁ U₂ a₁ a₂, U₁ ≤ U₂ → a₁ ≤ a₂ →
       E U₁ a₁ ≤ E U₂ a₂)

/--
Proposition 5 (Repository expansion)

Paper statement: Each repository has a required language. A weak reduction in
the entry cost for that required language weakly expands the expected number of
repositories. Expansion is strict when a positive-probability opportunity lies
in the new-versus-old entry band for some repository.

Source location: Appendix B.3, p. 65
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def repositoryExpansionSpec : Prop :=
  ∀ (S R K : Type) [Fintype S] [Fintype R]
      (w : S → ℝ) (requiredLanguage : R → K)
      (gain : S → R → ℝ) (c₁ c₂ : R → K → ℝ),
    (∀ s, 0 ≤ w s) →
    (∑ s, w s) = 1 →
    (∀ r, c₂ r (requiredLanguage r) ≤ c₁ r (requiredLanguage r)) →
    (let N := fun c s =>
       ∑ r, if c r (requiredLanguage r) ≤ gain s r then (1 : ℕ) else 0
     ((∑ s, w s * (N c₁ s : ℝ)) ≤
        ∑ s, w s * (N c₂ s : ℝ)) ∧
       ((∃ s r, 0 < w s ∧
           c₂ r (requiredLanguage r) ≤ gain s r ∧
           gain s r < c₁ r (requiredLanguage r)) →
         (∑ s, w s * (N c₁ s : ℝ)) <
           ∑ s, w s * (N c₂ s : ℝ)))

end QX26AgenticDelegation
