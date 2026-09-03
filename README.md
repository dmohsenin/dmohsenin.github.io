# Darian Mohsenin Website

This is a GitHub Pages site powered by Jekyll (which GitHub builds automatically).
Each page is a small Markdown file in `_entries`; the homepage and navigation are
generated from those files.

## Add a new page (easy way)

In PowerShell, from this folder, run:

```powershell
.\new-page.ps1 -Title "My new page" -Section life
```

Allowed sections are `life`, `prints`, `research`, `hobbies`, `art`, and `books`.
The script creates `_entries/my-new-page.md`. Open that file, replace the prompt
with your writing, save it, then commit and push as usual. The homepage tile and
the page URL are created automatically.

If PowerShell blocks the script, this command runs it without changing your
machine's execution policy:

```powershell
powershell -ExecutionPolicy Bypass -File .\new-page.ps1 -Title "My new page" -Section life
```

## Add a page without the script

Copy `TEMPLATE.md` into `_entries`, give it a simple filename such as
`my-new-page.md`, and edit the fields at the top. Write the page underneath the
second `---` using ordinary Markdown.

To add an image, put it somewhere under `assets/images` and uncomment the `image`
and `image_alt` lines. Example:

```yaml
image: /assets/images/personal/my-photo.jpg
image_alt: "Me hiking near the coast"
```

## Change site sections

Edit `_data/sections.yml`. Its order controls the navigation and homepage. Layout
files are in `_layouts`, and the appearance remains in `css/styles.css`.

## Publish

Commit and push the whole folder to the GitHub Pages repository. GitHub Pages
supports this Jekyll setup without a separate build step. In the repository's
Pages settings, deploy from the branch containing these files.
