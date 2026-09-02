import QX26AgenticDelegation.PaperInterface

/-!
# Proof Interface: Agentic Delegation and the Language Frontier of Software Developers

This file contains exact-type proof endpoints for the transparent propositions
in `PaperInterface.lean`. It is not a human semantic-review surface: one source
claim is reviewed once, against its expanded `...Spec : Prop` declaration.
-/

namespace QX26AgenticDelegation

/--
Lean proof endpoint for `frontierExpansionSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem frontierExpansion :
  frontierExpansionSpec := by
  intro K _ vS vC vD
  dsimp
  constructor
  · intro k
    by_cases h₁ : 0 ≤ max (vS k) (vC k)
    · simp [h₁, h₁.trans (le_max_left _ _)]
    · simp [h₁]
  · apply Finset.sum_le_sum
    intro k _
    by_cases h₁ : 0 ≤ max (vS k) (vC k)
    · simp [h₁, h₁.trans (le_max_left _ _)]
    · simp [h₁]

/--
Lean proof endpoint for `activationBandUnfamiliarSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem activationBandUnfamiliar :
  activationBandUnfamiliarSpec := by
  intro K _ TD TS T₁ B F hT₁ hB hBpos hMonotone _
  dsimp
  have hThreshold (k : K) : TD k < TS k := by
    have hb := hBpos k
    rw [hB k] at hb
    linarith
  constructor
  · intro k τ
    rw [hT₁ k]
    by_cases hD : TD k ≤ τ
    · by_cases hS : TS k ≤ τ
      · have hnlt : ¬ τ < TS k := not_lt.mpr hS
        simp [hD, hS, hnlt]
      · have hlt : τ < TS k := lt_of_not_ge hS
        simp [hD, hS, hlt]
    · have hS : ¬ TS k ≤ τ := fun h => hD ((hThreshold k).le.trans h)
      simp [hD, hS]
  · apply Finset.sum_nonneg
    intro k _
    exact sub_nonneg.mpr (hMonotone k (hThreshold k).le)

/--
Lean proof endpoint for `dynamicCumulativeLanguageEffectCorrectedSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem dynamicCumulativeLanguageEffectCorrected :
  dynamicCumulativeLanguageEffectCorrectedSpec := by
  intro K _ _ p₁ p₂ hDomain
  dsimp
  constructor
  · intro n
    apply Finset.sum_nonneg
    intro k _
    apply sub_nonneg.mpr
    apply pow_le_pow_left₀
    · linarith [(hDomain k).2.2]
    · linarith [(hDomain k).2.1]
  · intro hStrictDomain
    have hPointIncreasing (k : K) (n : ℕ) :
        (1 - p₁ k) ^ (n + 1) - (1 - p₂ k) ^ (n + 1) <
          (1 - p₁ k) ^ (n + 2) - (1 - p₂ k) ^ (n + 2) := by
      have hp₁ : p₁ k = 0 := (hStrictDomain k).1
      have hp₂pos : 0 < p₂ k := (hStrictDomain k).2.1
      have hp₂lt : p₂ k < 1 := (hStrictDomain k).2.2
      have hbasePos : 0 < 1 - p₂ k := by linarith
      have hpowPos : 0 < (1 - p₂ k) ^ (n + 1) := pow_pos hbasePos _
      have hpowStep :
          (1 - p₂ k) ^ (n + 2) = (1 - p₂ k) ^ (n + 1) * (1 - p₂ k) := by
        rw [show n + 2 = (n + 1) + 1 by omega, pow_succ]
      rw [hp₁]
      norm_num
      rw [hpowStep]
      nlinarith
    have hPointConcave (k : K) (n : ℕ) :
        ((1 - p₁ k) ^ (n + 2) - (1 - p₂ k) ^ (n + 2)) -
            ((1 - p₁ k) ^ (n + 1) - (1 - p₂ k) ^ (n + 1)) <
          ((1 - p₁ k) ^ (n + 1) - (1 - p₂ k) ^ (n + 1)) -
            ((1 - p₁ k) ^ n - (1 - p₂ k) ^ n) := by
      have hp₁ : p₁ k = 0 := (hStrictDomain k).1
      have hp₂pos : 0 < p₂ k := (hStrictDomain k).2.1
      have hp₂lt : p₂ k < 1 := (hStrictDomain k).2.2
      have hbasePos : 0 < 1 - p₂ k := by linarith
      have hpowPos : 0 < (1 - p₂ k) ^ n := pow_pos hbasePos _
      have hpowStep₁ :
          (1 - p₂ k) ^ (n + 1) = (1 - p₂ k) ^ n * (1 - p₂ k) := by
        rw [pow_succ]
      have hpowStep₂ :
          (1 - p₂ k) ^ (n + 2) = (1 - p₂ k) ^ (n + 1) * (1 - p₂ k) := by
        rw [show n + 2 = (n + 1) + 1 by omega, pow_succ]
      rw [hp₁]
      norm_num
      rw [hpowStep₂, hpowStep₁]
      calc
        (1 - p₂ k) ^ n * (1 - p₂ k) -
              (1 - p₂ k) ^ n * (1 - p₂ k) * (1 - p₂ k) =
            ((1 - p₂ k) ^ n * (1 - p₂ k)) * p₂ k := by ring
        _ < (1 - p₂ k) ^ n * p₂ k := by
          apply mul_lt_mul_of_pos_right
          · exact mul_lt_of_lt_one_right hpowPos (by linarith)
          · exact hp₂pos
        _ = (1 - p₂ k) ^ n - (1 - p₂ k) ^ n * (1 - p₂ k) := by ring
    constructor
    · intro n
      apply Finset.sum_lt_sum
      · intro k _
        exact (hPointIncreasing k n).le
      · let k₀ : K := Classical.choice inferInstance
        exact ⟨k₀, Finset.mem_univ k₀, hPointIncreasing k₀ n⟩
    · intro n
      rw [← Finset.sum_sub_distrib, ← Finset.sum_sub_distrib]
      apply Finset.sum_lt_sum
      · intro k _
        exact (hPointConcave k (n + 1)).le
      · let k₀ : K := Classical.choice inferInstance
        exact ⟨k₀, Finset.mem_univ k₀, hPointConcave k₀ (n + 1)⟩

/--
Lean proof endpoint for `specialistAbilityHeterogeneitySpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem specialistAbilityHeterogeneity :
  specialistAbilityHeterogeneitySpec := by
  intro A _ p hComparable
  rcases hComparable with ⟨hp, hMonotone⟩
  dsimp
  intro U₁ U₂ a₁ a₂ hU ha
  calc
    (U₁ : ℝ) * p a₁ ≤ (U₂ : ℝ) * p a₁ := by
      apply mul_le_mul_of_nonneg_right _ (hp a₁)
      exact_mod_cast hU
    _ ≤ (U₂ : ℝ) * p a₂ := by
      apply mul_le_mul_of_nonneg_left (hMonotone ha)
      positivity

/--
Lean proof endpoint for `repositoryExpansionSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem repositoryExpansion :
  repositoryExpansionSpec := by
  intro S R K _ _ w requiredLanguage gain c₁ c₂ hw _ hCosts
  dsimp
  let N : (R → K → ℝ) → S → ℕ :=
    fun c s => ∑ r, if c r (requiredLanguage r) ≤ gain s r then (1 : ℕ) else 0
  change
    ((∑ s, w s * (N c₁ s : ℝ)) ≤ ∑ s, w s * (N c₂ s : ℝ)) ∧
      ((∃ s r, 0 < w s ∧
          c₂ r (requiredLanguage r) ≤ gain s r ∧
          gain s r < c₁ r (requiredLanguage r)) →
        (∑ s, w s * (N c₁ s : ℝ)) < ∑ s, w s * (N c₂ s : ℝ))
  have hCountLE (s : S) : N c₁ s ≤ N c₂ s := by
    apply Finset.sum_le_sum
    intro r _
    by_cases hOld : c₁ r (requiredLanguage r) ≤ gain s r
    · simp [hOld, (hCosts r).trans hOld]
    · simp [hOld]
  constructor
  · apply Finset.sum_le_sum
    intro s _
    apply mul_le_mul_of_nonneg_left
    · exact_mod_cast hCountLE s
    · exact hw s
  · rintro ⟨s₀, r₀, hWeight, hNew, hOld⟩
    have hCountLT : N c₁ s₀ < N c₂ s₀ := by
      apply Finset.sum_lt_sum
      · intro r _
        by_cases h : c₁ r (requiredLanguage r) ≤ gain s₀ r
        · simp [h, (hCosts r).trans h]
        · simp [h]
      · refine ⟨r₀, Finset.mem_univ r₀, ?_⟩
        have hNotOld :
            ¬ c₁ r₀ (requiredLanguage r₀) ≤ gain s₀ r₀ := not_le.mpr hOld
        simp [hNotOld, hNew]
    apply Finset.sum_lt_sum
    · intro s _
      apply mul_le_mul_of_nonneg_left
      · exact_mod_cast hCountLE s
      · exact hw s
    · refine ⟨s₀, Finset.mem_univ s₀, ?_⟩
      apply mul_lt_mul_of_pos_left
      · exact_mod_cast hCountLT
      · exact hWeight

end QX26AgenticDelegation
