# DITA → EPUB Template (XMLmind ditac)

This repository is a template to build **EPUB / EPUB 3** from a DITA map using the reusable action **VT-Evia/ditac-epub-action**.

## How to use this template

1. Click **Use this template** → **Create a new repository**.
2. Edit your DITA content under `docs/`:
   - `docs/document.ditamap` (root map)
   - `docs/topics/` (DITA topics)
   - `docs/res/` (CSS/images included in the EPUB)
3. Push to `main` — GitHub Actions will build and upload an EPUB artifact.

## Build workflow

See `.github/workflows/build-epub.yml`. It uses:

```yaml
- uses: VT-Evia/ditac-epub-action@v1
  with:
    map: docs/document.ditamap
    output: out/book.epub
    format: epub3
    resources-dir: docs/res
    validate-with-epubcheck: 'true'
