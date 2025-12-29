# Hugo Site - The Amazing API

This site has been converted from Jekyll to Hugo. Here's what was changed and how to use it.

## Structure

- **`content/`** - All markdown content files
- **`layouts/`** - Hugo templates (converted from Jekyll `_layouts/`)
- **`static/`** - Static assets (CSS, JS) - these are copied directly to the site root
- **`config.toml`** - Hugo configuration (converted from Jekyll `_config.yml`)

## Key Conversions Made

### Front Matter
- Removed `layout: page` (Hugo uses template lookup automatically)
- Converted `permalink: /PATH` to `slug: PATH` in front matter
- Kept `title` field as-is

### Template Syntax
- `{{ page.title }}` → `{{ .Title }}`
- `{{ site.title }}` → `{{ .Site.Title }}`
- `{{ '/path' | relative_url }}` → `{{ "/path" | relURL }}`
- `{{ content }}` → `{{ .Content }}`
- `{% if page.url == '/' %}` → `{{ if eq .RelPermalink "/" }}`
- `{% if page.url contains 'X' %}` → `{{ if in .RelPermalink "X" }}`

### Layouts
- `_layouts/default.html` → `layouts/_default/baseof.html` (base template)
- `_layouts/page.html` → `layouts/_default/single.html` (for single pages)
- Created `layouts/index.html` for the homepage

### Assets
- `assets/` → `static/assets/` (Hugo copies static files directly)

## Running the Site

1. Install Hugo (if not already installed):
   ```bash
   brew install hugo
   # or download from https://gohugo.io/installation/
   ```

2. Start the development server:
   ```bash
   hugo server
   ```

3. Build the site:
   ```bash
   hugo
   ```
   This creates a `public/` directory with the generated site.

## URLs

The site uses the same URL structure as before:
- `/` - Homepage
- `/OUR_TECH_STORY` - Our Tech Story page
- `/USING_THE_API` - Using the API page
- `/OUR_CUSTOMERS` - Our Customers page
- `/MEET_THE_TEAM` - Meet the Team page
- `/JOHN_DOE`, `/JANE_SMITH`, `/BOB_JOHNSON`, `/ALICE_LEE` - Team member pages

## Notes

- All content files are in `content/` directory
- The homepage content is defined in `layouts/index.html`
- Static assets (CSS/JS) are in `static/assets/` and will be available at `/assets/` in the generated site
- The old Jekyll files (`_layouts/`, root `.md` files, etc.) are still present but not used by Hugo
