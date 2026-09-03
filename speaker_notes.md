# Speaker notes - 20-minute presentation

Target duration: **19 minutes 20 seconds**. The wording below is a talk track,
not text to read mechanically. Pause briefly after the model, identification,
and Lean slides.

## Slide 1 - Agentic Delegation and the Language Frontier (0:40)

Open with the paper's actual question: does agentic AI change only how fast a
developer works, or the set of technologies in which the developer can produce?
Say that the presentation combines three layers: the paper's threshold model,
its GitHub evidence, and an independent Lean audit. Point to the repository URL
and state that all formalization artifacts and caveats are public there.

**Transition:** “Before analyzing the paper, I need to resolve which paper the
assigned citation actually refers to.”

[Sources]

- Quispe and Xu, arXiv:2605.25438v2, title page.
- Repository: https://github.com/amchavezu/ai-03-quispe

## Slide 2 - The citation described an earlier draft (1:15)

Explain that the baseline citation named only Quispe and used *Coding Beyond
Your Training*. The pinned arXiv v2 has two authors, a different title, and an
explicit model-and-evidence framing. The v2 source says the old title belonged
to an earlier version, so the discrepancy is real rather than a typo invented
by the audit. Emphasize that every later claim uses v2 dated July 7, 2026.

**Transition:** “Once the source is fixed, the paper's contribution is much
more precise than a generic productivity claim.”

[Sources]

- Quispe and Xu, arXiv:2605.25438v2, title footnote and submission history.

## Slide 3 - The frontier is production, not learning (1:20)

State the question in plain language: can a Python developer ship work in Rust
by directing an agent, even without becoming a Rust programmer? The paper calls
that an expansion of the observed production frontier. Do not say the agent
teaches the language. General specification and verification ability remains a
human input, while language-specific execution can be delegated.

Stress four separate objects: production in a language, knowledge of that
language, general productivity, and agentic delegation. The data measure the
first; the model proposes the fourth as a mechanism.

**Transition:** “That distinction is encoded in a menu of production modes.”

[Sources]

- Quispe and Xu, Sections 1 and 4, especially the production-frontier remark.

## Slide 4 - Menu and primitives (1:35)

Introduce the three certainty-equivalent surpluses. Solo production combines
opportunity value, expected language-specific output, risk, and entry cost.
Conversational assistance adds a gain proportional to existing skill. Delegation
replaces a share of human execution with agent execution, but adds verification,
compute, and residual-error costs.

The developer does not solve a conventional effort-choice problem here. She
takes the maximum surplus in the available menu and activates the language only
when that maximum is nonnegative. General ability `a` matters because the human
must specify and verify the task.

**Transition:** “Writing the same rule as thresholds shows why unfamiliar
languages are the decisive margin.”

[Sources]

- Quispe and Xu, Section 4.1, Equations (1)-(3).

## Slide 5 - Thresholds and the foothold assumption (1:35)

Walk through the thresholds from top to bottom. `T^S` is the opportunity value
needed for solo production. Conversational assistance reduces it only by
`gamma*s-r_C`. Assumption 1 makes this term nonpositive in unfamiliar
languages, so the effective Generation-1 threshold remains `T^S`.

Delegation has a different threshold because its value depends on general
ability, agent competence, verification cost, and the substitution of agent
risk for human match risk. Define `B=T^S-T^D`. Only when `B>0` does delegation
open a new extensive margin.

**Transition:** “The economic result can now be drawn on a single opportunity
line.”

[Sources]

- Quispe and Xu, Section 4.2, Equations (4)-(7), pp. 14-15.

## Slide 6 - Activation band and main result (1:35)

Read the line from left to right. Weak opportunities are inactive under either
menu. Strong opportunities were already active. The middle interval
`[T^D,T^S)` is the set activated only by delegation.

Proposition 1 is mechanically weak: adding an option cannot shrink the chosen
set because the old options remain available. Proposition 2 adds the substantive
location claim. For an unfamiliar language, `B>0`, and a continuous opportunity
CDF, the activation probability equals `F(T^S)-F(T^D)`.

**Transition:** “A first use is a flow; the portfolio of everything ever used
is a stock, so their dynamics differ.”

[Sources]

- Quispe and Xu, Section 4.2, Propositions 1-2, pp. 15-16.

## Slide 7 - Flow, stock, and Proposition 3 (1:30)

Interpret `p^g` as the per-period first-use hazard. The probability that an
unfamiliar language has appeared by horizon `s` is one minus its survival
probability. Summing the difference across languages gives the cumulative gap.

The weak inequality is valid when `p^2>=p^1`. The paper then claims that the
closed-frontier benchmark `p^1=0<p^2` produces strict growth and concavity. Flag
the issue without proving it yet: the printed domain allows `p^2=1`, which
means immediate saturation.

**Transition:** “First, let us see whether the empirical flow and stock move in
the directions the model predicts.”

[Sources]

- Quispe and Xu, Section 4.3, Proposition 3, p. 17.
- Quispe and Xu, Theory Appendix, proof of Proposition 3.

## Slide 8 - Empirical magnitudes (1:45)

Describe the sample before the coefficients: 5,346 developers over 28 months,
with languages reconstructed from 3.15 million commits and 57.2 million changed
files. At adoption, active languages rise by 2.528 against a pre-adoption mean
of 0.90. Newly used languages rise by 1.193, the closest empirical counterpart
to the activation band. Entropy rises too, so the new languages carry meaningful
work rather than appearing as negligible file types.

The cumulative coefficient rises from 1.604 at adoption to larger later values,
but do not sell it as identified: it has non-trivial pre-trends and the authors
classify it as descriptive.

**Transition:** “Large and precisely estimated does not mean causal.”

[Sources]

- Quispe and Xu, Section 5, sample construction.
- Quispe and Xu, Section 7 and Table 2 (`table_cl_main.tex`).

## Slide 9 - Identification threat (1:45)

Use the diagram to explain the project-shock objection. A developer may begin an
unfamiliar-language project and adopt Claude because of that project. The same
shock then causes both the treatment date and the language outcome.

The staggered estimator handles cohort heterogeneity and avoids already-treated
controls. Removing Claude commits and the treatment-defining language addresses
mechanical counting. Neither check explains why adoption happened at that
moment. The modest rise at event time minus one reinforces timing concerns.
The honest conclusion is associational: a persistent pattern consistent with
delegation, not a causal delegation effect.

**Transition:** “A comparison paper shows why the mechanism also depends on how
AI enters the model.”

[Sources]

- Quispe and Xu, Section 9, “Discussion: Identification Threats.”

## Slide 10 - Comparison with Aouad, Lykouris, and Zhong (1:30)

Contrast the primitives, not the empirical settings. Quispe and Xu treat AI as
a menu expansion: information and augmentation are joined by delegated
execution, which can lower entry thresholds and expand the extensive margin.

Aouad, Lykouris, and Zhong model skill, effort, and assistance as additive,
substitutable inputs. More assistance reduces chosen effort. Once effort affects
future skill, or assistance is unreliable, the substitution can generate
productivity decline, deskilling, and skill polarization. Expansion and
deskilling are not contradictory facts; they follow from different modeled
margins.

**Transition:** “Lean is useful here because it forces every domain endpoint to
be stated rather than left implicit.”

[Sources]

- Quispe and Xu, Sections 1 and 4.
- Aouad, Lykouris, and Zhong (2026), Sections 1-5,
  https://arxiv.org/abs/2605.11350

## Slide 11 - Lean endpoint audit (2:15)

Start with the mathematical claim, not the code. The printed domain says
`p_1=0<p_2<=1`. At `p_2=1`, every language is first used with certainty in the
first period, so `G_s=1` at every observed horizon. Strict growth and strict
concavity are impossible after saturation.

Then read the corrected Spec boundary: weak nonnegativity stays on the printed
probability domain, while strict growth and concavity require `0<p_2<1` for
every language and a nonempty language type. In the refutation, Lean instantiates
the printed claim on the one-element type with `p_2=1`; the alleged strict
inequality at horizon zero simplifies to a contradiction.

Conclude carefully. Five proof endpoints compile, with no `sorry`, `admit`, or
axioms, and the paper-scoped build and fast check succeed. The status is still
`partially formalized`: Propositions 2 and 4 stop short of full probability and
expectation semantics, Proposition 5 is finite-support, and v11 semantic
closeout remains pending.

**Transition:** “The handwritten check reduces that formal counterexample to
seven lines of algebra.”

[Sources]

- `lean/PaperInterface.lean`, corrected Proposition 3 Spec.
- `lean/MainTheorems.lean`, printed endpoint counterexample.
- `lean/ProofInterface.lean`, corrected proof endpoint.
- `lean/FINAL_VALIDATION_REPORT.md` and `lean/status.json`.

## Slide 12 - Handwritten verification (1:15)

Point to each handwritten line rather than rereading the slide. The photograph
is the user's original derivation and is displayed without cropping or content
editing.

The check uses one unfamiliar language, `p_1=0`, and `p_2=1`. Substitute these
values into the one-language cumulative gap. The result equals one for every
horizon. Therefore both the first difference and the second difference equal
zero. This refutes the two strict conclusions but leaves weak nonnegativity
intact.

**Transition:** “Finally, even a valid frontier expansion does not by itself
identify delegated execution as the unique threshold-moving mechanism.”

[Sources]

- Quispe and Xu, Proposition 3 and its Theory Appendix proof.
- Independent Lean endpoint audit in `lean/MainTheorems.lean`.

## Slide 13 - Extension and conclusion (1:20)

Introduce a non-agentic productivity mode `V^P=V^S+q-r_P`. It lowers the solo
threshold by `q-r_P`; if this is positive, it creates an activation band even
though the developer still executes. Therefore extensive-margin expansion is
not mechanism-specific.

The distinguishing prediction is heterogeneity. Delegation should interact
with headroom, independent verification ability, and task-level evidence of
agent execution. A common productivity shift should not systematically load on
the last two margins. End on the balanced verdict: the paper documents a large
and robust production-breadth shift; Lean validates five mathematical cores and
finds a strict-endpoint defect; causal and mechanism-specific identification
remain open.

[Sources]

- Quispe and Xu, Theory Appendix and Sections 8-10.
- Independent extension in `extensions.md`.

## Likely questions and defensible answers

### “Does the paper show that developers learn new languages?”

No. The main claim concerns languages in which they produce under any available
mode. The paper explicitly distinguishes production from language-specific
skill. A learning channel appears only as a secondary appendix extension.

### “Why is Proposition 1 economically interesting if it follows from menu inclusion?”

Its weak form is mechanical. Proposition 2 supplies the economic content by
locating the change in a half-open activation band for unfamiliar languages.

### “Does the endpoint defect invalidate the empirical paper?”

No. It invalidates the strict dynamic statement at `p_2=1`. Weak cumulative
expansion remains valid, and the strict result is proved after adding the exact
condition `p_2<1`. The empirical identification concerns separate assumptions.

### “Why call the formalization partial if all five endpoints compile?”

Compilation proves the Lean statements, not automatic equivalence to every
probability and expectation claim in the paper. The audit records omitted
semantic bridges, finite-support scope, the corrected Proposition 3 domain, and
pending v11 closeout.

### “Could more coding activity alone explain the results?”

It can explain some raw breadth mechanically, but the paper conditions on
activity, uses per-commit outcomes, excludes Claude-authored commits, and finds
specialist concentration within activity groups. Those checks narrow the story,
but they do not eliminate project-driven selection into adoption.

### “Why is the generic-productivity extension not already in the appendix?”

The appendix derives the original thresholds, heterogeneity, Bayesian learning,
and repository expansion. It never introduces a language-independent,
non-agentic mode with threshold `T^P`, nor derives a test separating `T^P` from
`T^D`. Activity shocks are discussed as an interpretation, not modeled as this
alternative technology.
