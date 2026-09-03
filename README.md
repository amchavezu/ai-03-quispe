# Agentic Delegation and the Language Frontier of Software Developers

**Quispe, Alexander, and Kevin Xu (2026).** “Agentic Delegation and the
Language Frontier of Software Developers: A Model and Evidence from Claude
Code on GitHub.” [arXiv:2605.25438v2](https://arxiv.org/abs/2605.25438v2),
revised July 7, 2026.

## Question and decision rule

Can an agentic coding assistant expand the set of programming languages in
which a developer produces, even without increasing language-specific skill?
The paper studies a **production frontier**, not a learning frontier. For each
developer-language-month opportunity, the developer compares the
certainty-equivalent surplus from solo production (`S`), conversational
augmentation (`C`), and delegated execution (`D`), then uses the best
nonnegative mode:

\[
V^g=\max_{m\in\mathcal M_g}V^m,\qquad
Z^g=\mathbf 1\{V^g\ge 0\},\qquad
\mathcal M_1=\{S,C\}\subset\mathcal M_2=\{S,C,D\}.
\]

This is a menu and threshold rule; the paper does not posit a conventional
effort-maximization problem for this developer.

## Thresholds and activation

Solo production is viable when the opportunity value \(\omega\) clears

\[
T^S=b-s\mu+\frac{\rho s^2}{2\pi}.
\]

Conversational augmentation has threshold
\(T^C=T^S-(\gamma s-r_C)\), so
\(T^1=\min\{T^S,T^C\}\). Under Assumption 1, augmentation requires a
language-specific foothold: for an unfamiliar language,
\(\gamma s-r_C\le0\) and therefore \(T^1=T^S\).

Delegation instead has threshold

\[
T^D=b-(1-\lambda)s\mu-\lambda a z(A)+\kappa(a,s)+r_D
+\frac{\rho}{2}\left[\frac{(1-\lambda)^2s^2}{\pi}
+\sigma_D^2(a,s,A)\right].
\]

When the agentic advantage \(B\equiv T^S-T^D>0\), delegation activates an
unfamiliar language exactly in the half-open band
\([T^D,T^S)\). The band widens when delegated execution and risk substitution
outweigh verification, compute, and residual-error costs.

## Main theoretical and empirical results

Because \(\mathcal M_1\subset\mathcal M_2\), Proposition 1 gives weak,
pathwise frontier expansion: \(Z^2\ge Z^1\) and \(N^2\ge N^1\). Proposition
2 sharpens this result for unfamiliar languages under Assumption 1,
\(B>0\), and a continuous opportunity CDF: the activation probability is
\(F(T^S)-F(T^D)\), and expected language-count expansion is nonnegative
(Section 4.2, pp. 15-16).

The empirical prediction is a spike in newly used languages at adoption and a
later accumulation in the portfolio stock. In a 28-month panel of 5,346
developers built from 3.15 million commits and 57.2 million changed files,
the adoption-month estimates are +2.528 active languages, +1.193 newly used
languages, +0.382 language entropy, and +1.604 cumulative languages
(Section 7 and Table 2). The pre-adoption mean for active languages is 0.90.
The cumulative outcome is descriptive because its pre-trends are not clean.

These are **event-time associations**, not definitive causal effects. Claude
Code adoption is voluntary and may coincide with a new unfamiliar-language
project. The staggered design and robustness checks address several mechanical
explanations, but not time-varying project selection (Section 9).

## Lean verdict

The independent EconCSLib run exposes five proof endpoints, and all five
compile without `sorry`, `admit`, or axioms. This is nevertheless
**partially formalized**: some translations deliberately stop at semantic
boundaries (the probability/expectation bridges in Propositions 2 and 4 and
finite support in Proposition 5), and independent v11 semantic closeout remains
pending.

Proposition 3 also contains a genuine endpoint defect. The printed closed-frontier
domain permits \(p_2=1\), but then
\(1-(1-p_2)^{s+1}=1\) immediately: the cumulative effect saturates, so strict
growth and strict discrete concavity fail. Lean refutes the printed strict
claim at that endpoint and proves the corrected strict result for
\(0<p_2<1\). Both the paper-scoped build and
`python3 scripts/paper_contribution.py check QX26AgenticDelegation --fast`
completed successfully; the latter returned exit code `0`.

## Hand verification and repository map

`hand/prop3-endpoint.png` — verificación manual del endpoint `p₂ = 1` de la Proposición 3, donde el efecto se satura y falla el crecimiento estricto.

| Path | Contents |
| --- | --- |
| `lean/` | Independent Lean output, status, audits, proof interfaces, and validation report |
| `extensions.md` | Distinguishing delegation from a generic productivity shock |
| `presentation.tex` / `presentation.pdf` | Source and compiled 20-minute deck |
| `speaker_notes.md` | Timed talk track and question preparation |
| `hand/` | Pending handwritten endpoint verification |
| `prompts.md` | Raw Codex prompts and relevant raw responses |
