# Smooth hypersurfaces: the Euler characteristic as a binomial tail, its parity, the Kodaira trichotomy, and the Noether–Lefschetz window as the sequence A005581

**Lax Lean Archive record [`lax-894236`](https://laxarchive.org/lax-894236/)** — registered, permanent and citable.
Every statement in `concepts/` is proved in `proofs/` with no assumptions: **14 of 14 statements proved**,
rebuilt by the archive on its own machines against a pinned Mathlib before registration.

For a smooth hypersurface $X_d^n \subset \mathbb{P}^{n+1}$ of degree $d$ and dimension $n$, the classical formulas of Hirzebruch and Griffiths give the Euler characteristic $\chi(X_d^n) = ((1-d)^{n+2} - 1)/d + (n+2)$ and the geometric genus $h^{n,0} = \binom{d-1}{n+1}$. This submission takes these formulas as its starting point and proves the arithmetic facts that sit on top of them, for every degree and not only for tabulated values.

The Euler characteristic polynomial is the binomial tail $\sum_{k\ge 2}\binom{n+2}{k}(-d)^k$, which is why it has no constant or linear term. In every odd dimension $\chi$ is even for every degree, the parity fact that makes the mirror-symmetry expression $h^{2,1} = b_3/2 - h^{3,0}$ of a threefold an integer; for surfaces in $\mathbb{P}^3$, $h^{1,1} = \tfrac{2d^3}{3} - 2d^2 + \tfrac{7d}{3}$ is an integer and the three Hodge formulas satisfy the Betti relation $\chi = 2 + 2h^{2,0} + h^{1,1}$ identically. The Kodaira trichotomy of hypersurfaces (Fano, Calabi–Yau, general type) is the statement that $\binom{d-1}{n+1}$ is $0$, $1$, or at least $2$ according to $d \le n+1$, $d = n+2$, $d \ge n+3$; the genus–degree formula is the case $n = 1$.

For surfaces in $\mathbb{P}^3$ the Green–Voisin lower bound $d-3$ on the codimension of Noether–Lefschetz components is compared with the upper bound $p_g$: the two meet exactly for $d = 3, 4$, and their difference is the OEIS sequence A005581 evaluated at $d-3$, an identity first observed numerically and proved here for every $d$. Finally, the arithmetic obstruction behind the fact that a linear subspace $\mathbb{P}^m \subset X_d^{2m}$ is never a rational multiple of the hyperplane class $h^m$ for $d \ge 2$ is isolated: no rational $c$ has $c\,d = 1$ with $c^2 d$ an integer.

The geometric inputs (Hirzebruch–Riemann–Roch, Griffiths' Hodge numbers, the Green–Voisin bound, the intersection numbers $L\cdot h^m = 1$ and $h^m \cdot h^m = d$) are cited, not formalized; every statement here is about the resulting polynomials and binomial coefficients.

## What is inside

| Concept | Type | Title | Proved / stated |
|---|---|---|---|
| `EulerCharacteristic` | theorem | The Euler characteristic of a smooth hypersurface as a binomial tail | 1 / 1 |
| `GeometricGenus` | theorem | The Kodaira trichotomy of a hypersurface as a statement about binomial coefficients | 4 / 4 |
| `LinearSubspaceClass` | theorem | The arithmetic obstruction to a linear subspace class being a multiple of the hyperplane power | 1 / 1 |
| `NoetherLefschetzWindow` | theorem | The Noether–Lefschetz window of a surface in ℙ³ and the sequence A005581 | 4 / 4 |
| `Parity` | theorem | Parity of the Euler characteristic in odd dimension, and integrality for surfaces | 4 / 4 |

Each concept file states its results as `axiom`s beside a natural-language description
(that is the archive's format: statements are separated from proofs); the proof of each
one lives in `proofs/` and is checked by the Lean kernel. `build-output.json` is the
archive's own build record for this source commit.

## How to cite

In LaTeX, cite the record id: `\cite{lax-894236}`. The archive resolves it to the exact
statements and proofs, and a registered record cannot change under the citation
(a correction would be a new record that supersedes this one).

```bibtex
@misc{lax894236,
  author = {Cruz Cabrera, Joel},
  title = {Smooth hypersurfaces: the Euler characteristic as a binomial tail, its parity, the Kodaira trichotomy, and the Noether–Lefschetz window as the sequence A005581},
  year = {2026},
  howpublished = {Lax Lean Archive, record lax-894236},
  url = {https://laxarchive.org/lax-894236/}
}
```

Author: Joel Cruz Cabrera, ORCID [0009-0005-4048-1237](https://orcid.org/0009-0005-4048-1237).

## Rebuilding it

```bash
npm install -g lax-archive
lax build          # Lean v4.33.0, Mathlib db584cd6d46c
```

The pins are in `manifest.yaml`; the archive's build of this commit
(`be3fe13`) is recorded in `build-output.json`
(`archiveSha` `b836774b97d9`).

## Related

- The four records and their live counts: https://kodamaseclabs.com/publications
- Preprint: *The Noether–Lefschetz window of surfaces in P^3 is the sequence A005581*, doi:10.5281/zenodo.21535860.
- The window recomputed live in exact integers: https://kodamaseclabs.com/publications

## Use of AI

An AI tool (an agent running on the author's machine) wrote the Lean under the
author's direction; the author set the statements, reviewed every declaration
and checked the build before submitting. The archive then rebuilt everything
independently. What is proved is exactly what the kernel accepted, no more.

## License

Apache-2.0 (the archive's required license), see `LICENSE`.

<details><summary>BibTeX entries the record itself cites</summary>

```bibtex
@misc{cruzcabrera2026noetherlefschetz,
  author = {Cruz Cabrera, Joel},
  title = {The Noether--Lefschetz window of surfaces in P^3 is the sequence A005581},
  year = {2026},
  doi = {10.5281/zenodo.21535860},
  howpublished = {Zenodo}
}
@misc{oeisA005581,
  author = {{OEIS Foundation Inc.}},
  title = {Entry A005581 in The On-Line Encyclopedia of Integer Sequences},
  year = {2026},
  howpublished = {https://oeis.org/A005581}
}
@article{griffiths1969,
  author = {Griffiths, Phillip A.},
  title = {On the periods of certain rational integrals: I, II},
  journal = {Annals of Mathematics},
  volume = {90},
  year = {1969},
  pages = {460--541}
}
@article{green1988,
  author = {Green, Mark L.},
  title = {A new proof of the explicit Noether--Lefschetz theorem},
  journal = {Journal of Differential Geometry},
  volume = {27},
  year = {1988},
  pages = {155--159}
}
```
</details>
