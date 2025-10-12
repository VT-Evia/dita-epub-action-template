# DITA → EPUB Template (XMLmind ditac)

Template repository for building **EPUB / EPUB 3** from a DITA map or bookmap using the reusable action **VT-Evia/ditac-epub-action**.

---

## Table of Contents
- Getting Started
- Project Layout & Requirements
- ⚙️ Build & Download (CI Workflow)
- Optional: Release with Attached EPUB
- Customize the EPUB (resources directory)
- Troubleshooting
- Credits
- License

---

## Getting Started

1) Click **Use this template** → **Create a new repository**  
2) Keep the default structure; your DITA source files should live under `docs/`  
3) Commit any changes — the workflow will build an EPUB artifact for you

---

## Project Layout & Requirements

All content goes inside `docs/`:

```
├─ .github/
│  └─ workflows/
│     ├─ build-epub.yml        ← CI: build & upload EPUB
└─ docs/
   ├─ document.ditamap or bookmap.ditamap
   ├─ topics/…                  ← DITA topics
   ├─ images/…                  ← images (if any)
   └─ res/                      ← CSS & assets packaged in EPUB
      └─ styles.css
```

**Requirements**
- Use a **map** (`*.ditamap`) or **bookmap** as your main input.
- The default workflow references `docs/document.ditamap`.  
  If you rename your map, update the workflow(s) accordingly.

---

## ⚙️ Build & Download (CI Workflow)

Every push runs the build defined in `.github/workflows/build-epub.yml`. It uses:

```yaml
- uses: VT-Evia/ditac-epub-action@v1
  with:
    map: docs/document.ditamap      # or your bookmap
    output: out/book.epub
    format: epub3                   # or 'epub'
    resources-dir: docs/res
    validate-with-epubcheck: 'true'
```

### Get your EPUB artifact
1. Go to **Actions** → open the latest successful run  
2. Scroll to **Artifacts**  
3. Click **book-epub** to download your `.epub`

---

## Customize the EPUB (resources directory)

Place CSS (and any additional assets you want bundled) in `docs/res/` and keep `resources-dir: docs/res` in the workflow.  
Typical tweaks:
- `docs/res/styles.css` — typography, headings, spacing
- Add images or fonts if your EPUB design needs them

> Tip: you can pass extra `ditac` parameters via the action’s `extra-args` input if you need advanced behavior.

---

## Troubleshooting


- **Build fails with missing files**  
  Confirm all `href` references in your map/bookmap exist under `docs/`.

- **No styling in EPUB**  
  Ensure `resources-dir` points to your CSS folder (e.g., `docs/res/styles.css`).

- **Validation errors**  
  Check the EPUBCheck log in the workflow output and fix metadata/content issues accordingly.

---

## Credits

- **XMLmind DITA Converter (ditac)** — by **XMLmind**. See the official site for docs & licensing: https://www.xmlmind.com/ditac/  
- **VT-Evia/ditac-epub-action** — reusable GitHub Action that downloads `ditac`, builds EPUB/EPUB 3, and optionally runs EPUBCheck.  
- **EPUBCheck** — W3C community validator used optionally in CI.
- Your uncle ChatGPT.

---

## License

MIT for this template.  
`ditac` is distributed by XMLmind under its own license and is downloaded at build time.
