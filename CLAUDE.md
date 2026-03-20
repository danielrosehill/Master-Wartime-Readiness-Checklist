# Israel Wartime Readiness Field Guide

## Project Overview

A comprehensive civilian preparedness field guide for wartime in Israel, based on Home Front Command (Pikud HaOref) guidance. The primary deliverable is a **professionally designed, printable A4 PDF** built with **Typst**.

## Key Decisions

- **Typesetting**: Typst (not LaTeX, not pandoc)
- **Font**: Atkinson Hyperlegible (installed at `~/.local/share/fonts/`)
- **Flowcharts**: Fletcher package for Typst
- **Icons**: FontAwesome package for Typst
- **Graphics generation**: fal.ai via MCP (project `.mcp.json`), Nano Banana
- **Page size**: A4, print-optimised
- **Mascots**: Herman (donkey, safety/critical items) and Corn (sloth, wellness/comfort)

## Directory Structure

```
iterations/edits/v2/    — Current content source (markdown)
typst/                  — Typst source files (guide.typ + modules)
output/                 — Compiled PDF output
images/avatars/         — Herman and Corn mascot images
images/other/           — beyahad.png banner
assets/generated/       — AI-generated graphics
planning/               — Design briefs and toolchain notes
sources/hfc-official/   — Archived HFC guidance (HTML)
original/               — V1 original draft
```

## Build Commands

```bash
# Compile PDF
typst compile typst/guide.typ output/Israel-Wartime-Readiness-Field-Guide-v3.pdf

# Watch mode (auto-recompile on changes)
typst watch typst/guide.typ output/Israel-Wartime-Readiness-Field-Guide-v3.pdf

# Open PDF after compile
xdg-open output/Israel-Wartime-Readiness-Field-Guide-v3.pdf
```

## Typst Packages Available

- `fletcher` (0.5.7) — Flowcharts and diagrams
- `cetz` — Canvas/drawing (fletcher dependency)
- `fontawesome` (0.5.0) — Icons
- `oxifmt` — String formatting

## Design Guidelines

- **Beyahad banner** (`images/other/beyahad.png`) as page footer
- **Avatars** used as section companions to reduce intimidation factor
- **Colour scheme**: Blue/white/grey (Israeli flag theme)
- **Checkboxes**: Properly styled, not raw Unicode
- **Decision trees**: Visual flowcharts via Fletcher (not ASCII art)
- **Callout boxes** for tips, warnings, critical items
- **Colour-coded sections**: Red for critical/wartime, blue for preparation, green for wellness

## Content Source

All guide content lives in `iterations/edits/v2/Israel Wartime Readiness Checklist.md`. Content edits go there first, then the Typst source is updated to match.

## HFC Source Pages

The `sources/hfc-official/` HTML files were saved using the [SingleFile](https://github.com/nicjac/SingleFile) browser extension, which embeds all images as base64 data URIs inline in the HTML. To extract embedded images, use a base64 extraction script (not [SingleFileExtractor](https://github.com/Droppers/SingleFileExtractor) — that tool is for .NET single-file executables, not SingleFile HTML). Extracted and deduplicated images are in `sources/hfc-official/200326/extracted-images/`.

## Repo Visibility

This repo is **public**. Never commit API keys or secrets. The `.mcp.json` uses `${FAL_KEY}` env var reference.
