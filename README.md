# Dean Financials - Image Assets Repository

This repository manages all image assets for the Dean Financials website, automatically syncing them to Cloudflare R2 storage for CDN delivery.

## 📁 Directory Structure

```
deanfi-images/
├── articles/          # Article featured images (insights, blog posts)
├── authors/           # Author profile photos
├── defaults/          # Default/fallback images for categories
└── social/            # Social media sharing images (Open Graph, Twitter Cards)
```

## 🖼️ Image Requirements

### Google News Compliance Standards

All article images must meet Google News technical requirements for inclusion in Google News and Google Discover:

#### **Required Specifications:**

| Requirement | Specification | Notes |
|-------------|---------------|-------|
| **Minimum Width** | 1200 pixels | Google News requirement |
| **Recommended Dimensions** | 1600×900px (16:9) | Optimal for most displays |
| **Aspect Ratio** | 16:9 or 4:3 | Avoid extreme ratios (too wide/tall) |
| **Maximum File Size** | 10 MB | Smaller is better for performance |
| **Supported Formats** | JPEG, PNG, WebP | WebP recommended for best compression |
| **Color Space** | sRGB | Required for consistent display |
| **Resolution** | 72-150 DPI | 72 DPI sufficient for web |

#### **Quality Guidelines:**
- ✅ **High resolution** - Crisp, clear, professional photography
- ✅ **Relevant content** - Image must relate directly to article topic
- ✅ **Original or licensed** - No copyright violations
- ❌ **No excessive text** - Google may reject images with overlaid text
- ❌ **No logos/watermarks** - Avoid branding elements
- ❌ **No graphic/disturbing content** - Follow Google News content policies

### Format Recommendations by Use Case

#### **Article Featured Images** (`articles/`)
- **Recommended:** 1600×900px (16:9 aspect ratio)
- **Format:** WebP or JPEG (80-85% quality)
- **File Size:** < 300 KB optimized
- **Usage:** Main article header image, social sharing preview
- **Alt Text:** Descriptive, 10+ characters (defined in article frontmatter)

#### **Author Profile Photos** (`authors/`)
- **Recommended:** 400×400px (1:1 square)
- **Minimum:** 200×200px
- **Format:** WebP or JPEG
- **File Size:** < 50 KB
- **Usage:** Author bio cards, article bylines
- **Notes:** Professional headshot, neutral background preferred

#### **Default/Fallback Images** (`defaults/`)
- **Recommended:** 1600×900px
- **Format:** WebP or JPEG
- **File Size:** < 200 KB
- **Usage:** When no specific article image provided
- **Naming:** `{category}-default.jpg`
  - `market-analysis-default.jpg`
  - `retirement-planning-default.jpg`
  - `debt-management-default.jpg`
  - `financial-tips-default.jpg`

#### **Social Sharing Images** (`social/`)
- **Open Graph (Facebook, LinkedIn):** 1200×630px (1.91:1)
- **Twitter Card:** 1200×600px (2:1) or 1200×1200px (1:1)
- **Format:** JPEG or PNG
- **File Size:** < 5 MB (< 1 MB recommended)
- **Usage:** Custom social media previews

## 📝 File Naming Conventions

### Articles Directory
Use descriptive, kebab-case names matching your article slugs:

```
articles/
├── market-snapshot-2025-11-25.jpg
├── understanding-market-breadth.jpg
├── retirement-planning-guide-2025.webp
└── debt-payoff-strategies.jpg
```

**Pattern:** `{article-slug}.{ext}`

### Authors Directory
Use author name or ID:

```
authors/
├── sarah-dean.jpg
├── wes-dean.jpg
└── john-smith.webp
```

**Pattern:** `{author-id}.{ext}` (matching `src/content/authors/{author-id}.json`)

### Defaults Directory
Use category name with `-default` suffix:

```
defaults/
├── market-analysis-default.jpg
├── retirement-planning-default.jpg
├── debt-management-default.jpg
└── financial-tips-default.jpg
```

**Pattern:** `{category-slug}-default.{ext}`

### Social Directory
Use descriptive name with platform/type:

```
social/
├── homepage-og.jpg
├── about-twitter-card.jpg
└── markets-landing-facebook.jpg
```

**Pattern:** `{page-slug}-{platform}.{ext}`

## 🔗 Using Images in Your Website

### In Article Frontmatter

```markdown
---
title: "Market Snapshot: November 25, 2025"
image: "https://images.deanfi.com/articles/market-snapshot-2025-11-25.jpg"
imageAlt: "Market breadth chart showing S&P 500 advance-decline indicators"
imageWidth: 1600
imageHeight: 900
---
```

### CDN URL Pattern

After images are synced to R2, they're available at:

```
https://images.deanfi.com/{directory}/{filename}
```

**Examples:**
- `https://images.deanfi.com/articles/market-snapshot-2025-11-25.jpg`
- `https://images.deanfi.com/authors/sarah-dean.jpg`
- `https://images.deanfi.com/defaults/market-analysis-default.jpg`

### R2 Bucket Path

Images are stored in R2 maintaining the directory structure:

```
r2://deanfi-images/articles/{filename}
r2://deanfi-images/authors/{filename}
r2://deanfi-images/defaults/{filename}
r2://deanfi-images/social/{filename}
```

## 🚀 Workflow & Deployment

### Automatic Sync to R2

1. **Add images** to appropriate directory (`articles/`, `authors/`, etc.)
2. **Commit and push** to `main` branch
3. **GitHub Actions** automatically detects changed images
4. **Wrangler CLI** uploads to Cloudflare R2 with proper `Content-Type` headers
5. **Images available** immediately via CDN at `https://images.deanfi.com/`

### Manual Sync Trigger

Go to **Actions** → **Sync Images to Cloudflare R2** → **Run workflow**

This syncs ALL images in the repository (useful for initial setup or bulk changes).

### Supported Image Formats

The workflow automatically detects and sets correct `Content-Type` headers:

| Extension | Content-Type | Recommended Use |
|-----------|--------------|-----------------|
| `.jpg`, `.jpeg` | `image/jpeg` | Photos, complex images |
| `.png` | `image/png` | Graphics with transparency |
| `.webp` | `image/webp` | Modern format, best compression |
| `.svg` | `image/svg+xml` | Icons, logos (vector) |
| `.gif` | `image/gif` | Animations (use sparingly) |

## 🎨 Image Optimization Tips

### Before Uploading

1. **Resize to target dimensions** (e.g., 1600×900 for articles)
2. **Compress appropriately:**
   - **JPEG:** 80-85% quality (use tools like ImageOptim, TinyPNG)
   - **WebP:** 75-80% quality (better compression than JPEG)
   - **PNG:** Use pngquant or similar for smaller file sizes
3. **Strip metadata** (EXIF data) to reduce file size
4. **Convert to sRGB** color space

### Recommended Tools

- **CLI:** `imagemagick`, `cwebp`, `pngquant`
- **Online:** TinyPNG, Squoosh.app, Cloudinary
- **Desktop:** Adobe Photoshop, GIMP, ImageOptim (Mac)

### Example: Resize and Optimize with ImageMagick

```bash
# Resize to 1600x900 and optimize JPEG
convert input.jpg -resize 1600x900^ -gravity center -extent 1600x900 -quality 85 -strip output.jpg

# Convert to WebP with 80% quality
cwebp -q 80 input.jpg -o output.webp

# Resize author photo to 400x400 square
convert author.jpg -resize 400x400^ -gravity center -extent 400x400 -quality 85 -strip author-optimized.jpg
```

## 📊 Google News Image Best Practices

### ✅ DO:
- Use **high-resolution** images (min 1200px wide)
- Ensure **aspect ratio** is 16:9 or 4:3
- Use **relevant, original** photography
- Provide **descriptive alt text** (10+ characters)
- Keep file size **under 300 KB** when possible
- Use **professional, clear** imagery

### ❌ DON'T:
- Use images **smaller than 1200px** wide
- Include **excessive text overlays**
- Add **logos or watermarks**
- Use **extreme aspect ratios** (too narrow/wide)
- Exceed **10 MB file size**
- Violate **copyright** (always use licensed/original images)

### Alt Text Requirements

**Minimum:** 10 characters (enforced in Content Collections schema)

**Good examples:**
- ✅ "Market breadth chart showing S&P 500 advance-decline indicators and momentum trends"
- ✅ "Financial advisor reviewing retirement portfolio with elderly couple"
- ✅ "Graph comparing debt payoff strategies: snowball vs avalanche method"

**Bad examples:**
- ❌ "Chart" (too short)
- ❌ "Image" (not descriptive)
- ❌ "" (empty)

## 🔒 Security & Access

### Repository Secrets Required

Configure these secrets in **Settings** → **Secrets and variables** → **Actions**:

| Secret | Description | Example |
|--------|-------------|---------|
| `CLOUDFLARE_API_TOKEN` | Cloudflare API token with R2 write permissions | `abc123...` |
| `CLOUDFLARE_ACCOUNT_ID` | Your Cloudflare account ID | `def456...` |
| `R2_BUCKET_NAME` | Name of your R2 bucket | `deanfi-images` |

### Permissions

- Images synced to R2 are **publicly readable** via CDN
- Only authenticated GitHub Actions can **write** to R2
- **No authentication required** for CDN access (public website images)

## 📚 Related Documentation

- **Content Collections:** `/deanfi-website/src/content/insights/_README.md`
- **Article Schema:** `/deanfi-website/src/content/config.ts`
- **Google News Guidelines:** https://support.google.com/news/publisher-center/answer/9606702
- **Schema.org NewsArticle:** https://schema.org/NewsArticle
- **Cloudflare R2 Docs:** https://developers.cloudflare.com/r2/

## 🆘 Troubleshooting

### Images Not Appearing on Website

1. **Check GitHub Actions:** Go to **Actions** tab, verify workflow succeeded
2. **Verify file path:** Ensure image is in correct directory (`articles/`, `authors/`, etc.)
3. **Check filename:** Must match exactly in article frontmatter (case-sensitive)
4. **Test CDN URL:** Visit `https://images.deanfi.com/articles/{filename}` directly
5. **Clear cache:** R2 CDN may take 1-2 minutes to propagate

### Workflow Failing

1. **Check secrets:** Verify all 3 secrets are configured correctly
2. **Review logs:** Click on failed workflow, check error messages
3. **File format:** Ensure using supported formats (jpg, png, webp, svg, gif)
4. **File size:** Very large files (>100 MB) may cause timeouts

### Image Quality Issues

1. **Check source resolution:** Ensure original image is high-res
2. **Verify compression:** May need to adjust quality settings
3. **Test different formats:** WebP often provides better quality at smaller sizes
4. **Review optimization:** May have compressed too aggressively

## 📧 Support

For issues or questions:
- **GitHub Issues:** [deanfi-images/issues](https://github.com/DeanFinancials/deanfi-images/issues)
- **Documentation:** See `/deanfi-website/src/content/insights/_README.md` for usage in articles

---

**Last Updated:** November 25, 2025  
**Maintained By:** Dean Financials Team
