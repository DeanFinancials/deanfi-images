# AI Image Generation Prompts for Default Images

Use these prompts with AI image generators like DALL-E 3, Midjourney, Stable Diffusion, or Adobe Firefly.

**CRITICAL REQUIREMENTS FOR ALL IMAGES:**
- Aspect Ratio: **16:9** (1600×900 pixels)
- Minimum Width: **1200 pixels** (recommend 1600px or higher)
- Style: Professional, clean, high-quality
- No text overlays, logos, or watermarks
- sRGB color space
- Save as JPEG (85% quality) or WebP (80% quality)

---

## 1. Market Analysis Default
**Filename:** `market-analysis-default.jpg`

### DALL-E 3 / ChatGPT Prompt:
```
Create a professional financial market analysis visualization in 16:9 aspect ratio. 
Show a modern stock market chart with candlestick patterns, moving average lines 
in green (#10b981) and blue, and volume bars at the bottom. Include technical 
indicators like RSI or MACD in subtle panels. Use a clean, professional design 
with a dark navy blue background (#1e293b) and bright data visualization colors. 
The chart should show an upward trending market. No text, labels, or watermarks. 
High-quality, sharp, professional trading terminal aesthetic. Photorealistic 
chart display on a clean interface.
```

### Midjourney Prompt:
```
professional stock market chart display, candlestick patterns with green and 
blue moving averages, dark navy background, modern financial terminal interface, 
upward trending data, clean technical analysis visualization, no text, 
16:9 aspect ratio, photorealistic, high detail --ar 16:9 --style raw --v 6
```

### Stable Diffusion Prompt:
```
professional stock market trading chart, candlestick pattern analysis, 
technical indicators, green and blue moving average lines, volume bars, 
dark blue background, modern financial interface, upward trend, clean 
professional design, no text overlays, high resolution, sharp focus, 
photorealistic rendering
Negative prompt: text, labels, watermarks, logos, people, low quality, blurry
```

---

## 2. Retirement Planning Default
**Filename:** `retirement-planning-default.jpg`

### DALL-E 3 / ChatGPT Prompt:
```
Create a warm, professional retirement planning scene in 16:9 aspect ratio. 
Show a happy elderly couple (60-70 years old) sitting together at a clean 
wooden desk, reviewing financial documents with a laptop and calculator visible. 
Natural window lighting from the left, creating a peaceful, optimistic atmosphere. 
The couple should appear content and confident about their retirement plans. 
Include subtle props: reading glasses, coffee cups, organized folders. Modern 
home office setting with plants in background. Photorealistic, professional 
photography style, warm color tones (soft blues and warm beiges). No text, 
graphs, or charts visible on documents. Focus on the emotional aspect of 
successful retirement planning.
```

### Midjourney Prompt:
```
elderly couple reviewing retirement documents at desk, laptop and calculator, 
warm natural lighting from window, peaceful home office, organized financial 
planning, content and confident expression, modern interior, soft focus 
background with plants, professional photography, warm color palette, 
photorealistic, no text visible --ar 16:9 --style raw --v 6
```

### Stable Diffusion Prompt:
```
retirement planning scene, elderly couple at desk with laptop and documents, 
warm natural window light, peaceful home office, financial planning, optimistic 
mood, professional photography, shallow depth of field, soft warm colors, 
organized workspace, plants in background, high quality, photorealistic
Negative prompt: text, charts, graphs, logos, sad faces, cluttered, dark, 
messy, low quality
```

---

## 3. Debt Management Default
**Filename:** `debt-management-default.jpg`

### DALL-E 3 / ChatGPT Prompt:
```
Create an empowering debt freedom concept image in 16:9 aspect ratio. Show a 
clean, organized desk from above (bird's eye view) with scissors cutting through 
a credit card, a calculator displaying zeros, neatly stacked paid bills with 
a red "PAID" stamp visible on top, and organized financial documents in folders. 
Include a laptop showing a simple budget spreadsheet (no readable text). Bright, 
clean lighting suggesting clarity and relief. Color scheme: whites, light grays, 
touches of green (success) and blue (trust). Minimalist, professional style. 
The composition should feel organized, freeing, and optimistic - conveying 
successful debt elimination. No people visible, just hands if needed. 
Photorealistic, professional product photography style.
```

### Midjourney Prompt:
```
overhead view of organized desk, scissors cutting credit card, calculator with 
zeros, paid bills with red stamp, financial freedom concept, clean minimalist 
style, bright professional lighting, organized folders, laptop with budget 
spreadsheet, white and gray tones with green accents, relief and success theme, 
professional product photography, no people --ar 16:9 --style raw --v 6
```

### Stable Diffusion Prompt:
```
debt freedom concept, top-down view of clean desk, credit card being cut with 
scissors, calculator, paid stamp on bills, organized documents, bright clean 
lighting, minimalist professional style, white and gray colors with green 
accents, financial organization, relief theme, high quality product photography, 
sharp focus
Negative prompt: text, people faces, cluttered, messy, dark, chaotic, logos, 
watermarks, low quality
```

---

## 4. Financial Tips Default
**Filename:** `financial-tips-default.jpg`

### DALL-E 3 / ChatGPT Prompt:
```
Create a modern, vibrant financial wisdom concept illustration in 16:9 aspect 
ratio. Show a glowing lightbulb as the central element, with floating financial 
icons orbiting around it: dollar signs, upward trending arrows, piggy bank, 
shield (protection), growth chart, and percentage symbols. Use a gradient 
background transitioning from deep blue (#1e40af) to gold (#f59e0b). Modern 
flat design illustration style with subtle 3D depth and soft shadows. The 
lightbulb should be glowing warmly, representing smart financial ideas and 
innovation. Icons should be clean, simple, and professional - not cartoonish. 
Convey intelligence, growth, and financial literacy. No text or labels. 
High-quality vector illustration style, professional and inspiring.
```

### Midjourney Prompt:
```
glowing lightbulb with floating financial icons, dollar signs, growth charts, 
piggy bank, shield, arrows, modern flat illustration, blue to gold gradient 
background, smart money concept, innovation theme, clean simple icons, 
professional style, subtle 3D depth, soft shadows, inspiring and intelligent, 
no text --ar 16:9 --style raw --v 6
```

### Stable Diffusion Prompt:
```
financial wisdom illustration, glowing lightbulb center, floating financial 
icons around it, dollar signs, growth charts, piggy bank symbols, modern flat 
design, blue and gold gradient background, professional vector illustration 
style, clean simple shapes, innovation concept, smart money theme, high quality, 
sharp vector graphics
Negative prompt: text, labels, cartoonish, childish, cluttered, realistic photos, 
people, 3D renders, logos, watermarks
```

---

## Post-Generation Processing

After generating images with AI tools, process them to meet exact requirements:

### 1. Resize to Exact Dimensions (if needed):
```bash
# Install ImageMagick if not installed
sudo apt install imagemagick

# Resize and crop to exact 1600x900
convert input.png -resize 1600x900^ -gravity center -extent 1600x900 output.jpg
```

### 2. Optimize File Size:
```bash
# JPEG optimization (85% quality)
convert input.jpg -quality 85 -strip -colorspace sRGB market-analysis-default.jpg

# Or convert to WebP (recommended)
cwebp -q 80 input.jpg -o market-analysis-default.webp
```

### 3. Verify Dimensions:
```bash
identify market-analysis-default.jpg
# Should output: market-analysis-default.jpg JPEG 1600x900 ...
```

---

## Tips for AI Image Generation

1. **DALL-E 3 (ChatGPT Plus/Pro):**
   - Best for photorealistic scenes (retirement, debt management)
   - Specify "16:9 aspect ratio" explicitly
   - Request "no text" to avoid labels
   - May need 2-3 generations to get perfect result

2. **Midjourney:**
   - Use `--ar 16:9` parameter for aspect ratio
   - `--style raw` for more photorealistic results
   - `--v 6` for latest model
   - Try `--quality 2` for higher detail

3. **Stable Diffusion (local or online):**
   - Set image size to 1600×900 in settings
   - Use negative prompts aggressively
   - May need to upscale if generating at lower resolution
   - Use ControlNet for precise composition control

4. **Adobe Firefly:**
   - Select "Landscape" preset then adjust to 16:9
   - Use "Photo" style for realistic images
   - Use "Graphic" style for the financial tips illustration
   - Download highest quality available

---

## Quality Checklist

Before uploading to repository, verify each image:

- ✅ Dimensions are 1600×900 pixels (or larger, maintaining 16:9)
- ✅ File size is under 300 KB (preferably 150-250 KB)
- ✅ Format is JPEG or WebP
- ✅ No text, watermarks, or logos visible
- ✅ Image is sharp and high-quality
- ✅ Colors look professional (not oversaturated)
- ✅ sRGB color space (convert if needed)
- ✅ File named correctly: `{category}-default.jpg`

---

## Alternative: Stock Photos

If AI generation isn't working, try these search terms on Unsplash/Pexels:

- **Market Analysis:** "stock market chart", "trading screen", "financial graph"
- **Retirement:** "elderly couple planning", "retirement happiness", "financial advisor"
- **Debt Management:** "financial freedom", "debt free celebration", "organized finances"
- **Financial Tips:** "lightbulb idea", "financial planning concept", "money growth"

Download at least 1920×1080 (Full HD) then crop/resize to 1600×900.
