# Formalization Plan: QX26 Agentic Delegation

## Frozen source

Exact source: https://arxiv.org/abs/2605.25438v2, arXiv v2, 2026-07-07. Private source artifacts are SHA-256 pinned outside Git. Normal inventory contains Assumptions 1–3 and Propositions 1–5.

## Dependency and result map

| Order | Target | Dependencies | Result |
| ---: | --- | --- | --- |
| 1 | Assumptions 1–2 | model primitives | transparent predicates |
| 2 | Proposition 1 | menu inclusion | proved |
| 3 | Proposition 2 | Assumption 1, B>0, continuous CDF | proved |
| 4 | Proposition 3 | hazard domains | corrected proof; printed endpoint refuted |
| 5 | Assumption 3 | verification motivation | transparent predicate |
| 6 | Proposition 4 | Assumption 3 | proved |
| 7 | Proposition 5 | lower required-language cost | finite-support proof |

Fidelity decisions: preserve p2=1 in the archival claim; require p2<1 only in the corrected strict endpoint; interpret Proposition 4 increasing weakly; count each repository once through its required language; retain finite-support Proposition 5 as a partial boundary. Five exact Spec/proof pairs compile. Independent v11 closure remains open.
