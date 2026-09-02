# Extension: Can a generic productivity shock mimic frontier expansion?

The paper argues that delegated execution lowers entry thresholds in unfamiliar
languages. The observed expansion is consistent with that mechanism, but
frontier expansion alone need not uniquely identify delegation. This extension
adds a deliberately non-agentic benchmark: an AI improvement that raises
productivity without executing, inspecting, or debugging on the developer's
behalf.

## 1. Assumption modified

The paper's Generation-1 mode is skill-complementary:

\[
V^C=V^S+\gamma s-r_C.
\]

Assumption 1 imposes \(\gamma\underline{s}-r_C\le0\) for unfamiliar
languages, so conversational augmentation cannot move their entry threshold.
Replace that restriction with a generic, language-independent productivity
increment \(q\ge0\), still requiring the developer to execute the task:

\[
V^P=V^S+q-r_P.
\]

Mode \(P\) contains no delegation share \(\lambda\), agent competence
\(z(A)\), verification technology \(\kappa(a,s)\), or agent-error variance.

## 2. Threshold and rule that change

The non-agentic productivity threshold is

\[
T^P=T^S-(q-r_P).
\]

If \(q>r_P\), an unfamiliar language is activated for
\(\omega\in[T^P,T^S)\). Thus a generic productivity shock can create a band
and weakly expand the production frontier even though the developer remains
the executor. With both technologies available, the relevant threshold is

\[
T^{\mathrm{post}}=\min\{T^1,T^P,T^D\}.
\]

The observed extensive margin alone therefore does not reveal whether
\(T^P\) or \(T^D\) moved.

## 3. Economic mechanism

Delegation substitutes general specification-and-verification ability for
language-specific execution. Its threshold reduction
\(B_D=T^S-T^D\) varies with \(a\), \(s\), \(\lambda\), \(z(A)\),
\(\kappa\), and residual risk. A generic shock instead lowers the cost of
producing every opportunity by \(q-r_P\), regardless of who executes or how
many unfamiliar-language candidates the developer has.

Both mechanisms can increase observed production. Only delegation predicts
that the effect is especially strong where language-specific execution is weak
but general specification and verification ability are high.

## 4. Paper result that may cease to identify delegation

Propositions 1 and 2 remain mathematically valid as menu-expansion results,
but their empirical interpretation is no longer unique. A positive activation
band is not, by itself, sufficient evidence that delegated execution caused the
threshold reduction. Proposition 4's specialist-by-ability pattern becomes the
key discriminating implication rather than a secondary heterogeneity result.

## 5. Distinguishing prediction

Under the generic shock, the threshold shift \(q-r_P\) is common across
languages and should not systematically grow with a developer's
specification-and-verification ability. Conditional on activity, expansion
should be broadly proportional across familiar and unfamiliar work.

Under delegation, expansion should be concentrated among developers with:

1. many unfamiliar candidates (high headroom),
2. strong independent proxies for specification and verification ability, and
3. tasks where execution traces show file edits, commands, tests, and iterative
   repair by the agent.

A useful estimand is therefore a triple difference: post-adoption change by
pre-adoption portfolio breadth, independently measured ability, and task-level
delegation intensity. A generic shock predicts little systematic interaction
with the last two margins; delegation predicts a positive interaction.

## 6. Evidence and design required

The current volume proxy is not a clean measure of ability. A stronger design
would combine account age, accepted pull requests, code-review history, and
organizational role with task-level execution traces. Exogenous variation in
access to agentic execution - for example, an institutional feature rollout -
could be crossed with continued access to conversational assistance. The most
informative outcomes would separate agent-authored commits, unassisted commits,
familiar-language work, and first uses of unfamiliar languages.

## 7. Why this is not already resolved in the appendices

The Theory Appendix derives the CARA-Normal certainty equivalent, threshold
algebra, Propositions 1-5, specialist and ability heterogeneity, Bayesian
learning after agentic interaction, and repository expansion. It does not
introduce a language-independent non-agentic mode \(V^P\) or derive conditions
under which that mode is observationally equivalent to delegation on the
extensive margin. The empirical appendix studies robustness to activity volume
and tool classification, but does not identify the threshold shift separately.

The paper itself notes that a uniform activity shock has difficulty matching
the specialist pattern and that causal separation requires exogenous adoption
variation. This extension turns that interpretive objection into an explicit
alternative model and a discriminating test; it does not claim that the paper
already provides that test.

## 8. Limitations

The common increment \(q\) is intentionally stark. A real non-agentic tool may
also be skill-complementary, task-specific, or selected in response to project
shocks, in which case its predictions can approach those of delegation. Task
traces may misclassify who executed the work, and ability proxies may remain
endogenous. The extension identifies what additional variation is needed; it
does not convert the current event study into a causal decomposition.

