# Israel Civilian Readiness Guide

A comprehensive field guide and checklist system for civilian preparedness during wartime in Israel.

**[Read the guide online](https://israel-civilian-readiness-guide.vercel.app/)**

## Disclaimer

**This is NOT an official government resource.** This guide is community-authored by Daniel Rosehill with AI assistance. It is based on publicly available guidance from the Israel Home Front Command (Pikud HaOref) but carries **no warranty of any kind**.

**Always follow official instructions** from HFC, the IDF, Israel Police, and local authorities.

**Official source:** [oref.org.il](https://www.oref.org.il) | **HFC Hotline:** 104

## What's In The Guide

- **Quick Smoke Test (PAWS BED)** — 7-item rapid readiness check with mnemonic
- **Master Checklist** — Full readiness verification (tech, home, go bag, people, personal effects, situational awareness)
- **Situational Checklists** — Daytime posture, after shelter reset, before showering, before bed, before leaving home
- **Guidance Notes** — Go bag selection, shelter behaviour, moving safely, night alarms, alert fatigue, protracted conflict wellness, caring for vulnerable neighbours, public shelters, OPSEC, infiltration protocol
- **Appendices** — HFC app config, emergency numbers, mamad inspection, protected space decision tree, Hebrew glossary, emergency radio frequencies, pantry planning

## Repository Structure

```
docs/               Website source (MkDocs, 7 languages)
typst/              PDF source files (Typst typesetting)
output/             Compiled PDFs and printable checklists
images/             Mascot avatars (Herman & Corn) and graphics
assets/generated/   AI-generated graphics
archive/            Historical drafts, planning docs, review notes
```

### Key Files

| File | Purpose |
|------|---------|
| `typst/guide.typ` | Main Typst source for the printable PDF |
| `typst/printables/*.typ` | Individual printable checklist sources |
| `docs/en/*.md` | English website content |
| `mkdocs.yml` | MkDocs site configuration |
| `output/*.pdf` | Compiled PDF field guides |
| `output/printables/` | Individual printable checklists (PDF + PNG) |

## Formats

The guide is available in three formats:

- **Website** — [Read online](https://israel-civilian-readiness-guide.vercel.app/) with interactive checklists (7 languages)
- **PDF** — Professionally typeset A4 document designed for printing and binding (`output/`)
- **Printable checklists** — Individual one-page checklists for posting around the home (`output/printables/`)
- **Audiobook** — [Listen to the audiobook (M4A)](https://cf-cdn.danielrosehill.com/audio/audiobooks/Israel-Wartime-Readiness-Field-Guide-Audiobook.m4a)

## Building

**Website (MkDocs):**
```bash
pip install -r requirements.txt
mkdocs build        # Output: site/
mkdocs serve        # Local preview at localhost:8000
```

**PDF (Typst):**
```bash
typst compile typst/guide.typ output/Israel-Wartime-Readiness-Field-Guide-v4.pdf
```

## Licence

Share freely with attribution. Modify as needed for your household.
