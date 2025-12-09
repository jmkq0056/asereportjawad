# AAU LaTeX Template for Agile Software Engineering

**Professional template based on Aalborg University's official structure**

Inspired by the AAU P2 template and adapted for the ASE exam assignment.

---

## 🎯 Quick Navigation

- **📖 [Full Documentation](docs/README.md)** - Complete guide with all features
- **🚀 [Quick Start Guide](docs/QUICK_START.md)** - Get running in 5 minutes
- **📧 Contact**: Ready to use for both Jawad & Shafe

---

## ⚡ Get Started NOW

### Overleaf (Easiest):
1. Go to https://www.overleaf.com
2. Upload this `common_template` folder
3. Set main document to `main.tex`
4. Click "Recompile"

### Local Computer:
```bash
cd common_template
./scripts/compile.sh
```

---

## 📂 Folder Structure

```
common_template/
│
├── main.tex                    # ⭐ MAIN FILE - Your document starts here
├── aau.cls                     # AAU document class (don't touch)
├── references.bib              # 📚 Add your references here
│
├── chapters/                   # ✏️ Edit these files with your content
│   ├── 01_introduction.tex
│   ├── 02_problem_identification.tex
│   ├── 03_agile_solutions.tex
│   ├── 04_agile_evaluation.tex
│   ├── 05_stakeholder_mapping.tex
│   ├── 06_software_quality.tex
│   ├── 07_production_pipeline.tex
│   ├── 08_conclusion.tex
│   └── appendix.tex
│
├── figures/                    # 🖼️ Put your images here
├── AAUgraphics/               # 🎨 AAU official logos (don't delete)
│
├── scripts/                    # ⚙️ Automation scripts
│   ├── compile.sh             # Run this to compile
│   └── clean.sh               # Run this to clean up
│
└── docs/                       # 📖 Documentation
    ├── README.md              # Complete documentation
    └── QUICK_START.md         # 5-minute guide
```

---

## ✨ What You Get

✅ **Official AAU Styling**
- Professional cover page with info tables
- Synopsis/metadata page
- AAU logos and branding
- Proper academic formatting

✅ **Smart Organization**
- Each chapter in separate file
- Easy to navigate and edit
- Modular structure

✅ **Modern Features**
- Clickable table of contents
- Automatic page numbering
- Cross-references
- Bibliography management
- Code syntax highlighting

✅ **Ready to Use**
- Pre-structured for ASE exam
- 8 chapters + appendix
- Interview questions included
- Compilation scripts

---

## 🎯 Your Next Steps

### 1️⃣ **Edit Your Information** (2 minutes)
Open `main.tex` and update lines 90-105:
```latex
\author{Your Name Here}           % ← Change this
\studentnumber{20XXXXXX}          % ← Change this
\studentemail{xxxx@student.aau.dk} % ← Change this
```

### 2️⃣ **Test Compilation** (1 minute)
```bash
./scripts/compile.sh
```
Or click "Recompile" in Overleaf

### 3️⃣ **Add Your Content** (ongoing)
Edit files in `chapters/` folder - replace placeholder text

### 4️⃣ **Add References** (as needed)
Add to `references.bib` and cite with `\textcite{key}`

---

## 📖 Documentation

### For Beginners:
→ Read **[Quick Start Guide](docs/QUICK_START.md)**

### For Complete Details:
→ Read **[Full Documentation](docs/README.md)**

### Quick Reference:

**Compile:**
```bash
./scripts/compile.sh
```

**Clean:**
```bash
./scripts/clean.sh
```

**Add image:**
```latex
\includegraphics[width=0.8\textwidth]{figures/image.png}
```

**Cite:**
```latex
\textcite{reference2024}
```

---

## 🎨 Features from Inspiration

This template is based on the AAU P2 template structure with:

- ✅ Custom `aau.cls` document class
- ✅ Beautiful frontmatter with `\maketitle` and `\makesynopsispage`
- ✅ Official AAU graphics and branding
- ✅ Modular chapter organization
- ✅ Professional academic styling
- ✅ Proper section numbering and TOC

**Plus additions for ASE exam:**
- ✅ Adapted cover page with student/interviewee tables
- ✅ Chapter structure matching ASE requirements
- ✅ Pre-written interview questions in appendix
- ✅ BibLaTeX for modern citations
- ✅ Compilation automation scripts

---

## ✅ Requirements

### Software Needed:
- **LaTeX Distribution** (one of):
  - macOS: [MacTeX](https://www.tug.org/mactex/)
  - Windows: [MiKTeX](https://miktex.org/)
  - Linux: `sudo apt-get install texlive-full`
- **OR** just use **Overleaf** (no installation needed!)

### Files Included:
- ✅ Main template (`main.tex`)
- ✅ AAU class file (`aau.cls`)
- ✅ AAU graphics (logos, waves)
- ✅ Chapter templates
- ✅ Bibliography file
- ✅ Scripts for compilation

---

## 🤝 For Both Jawad & Shafe

### Option A: Shared Overleaf
One person uploads, shares link with other → collaborate in real-time

### Option B: Separate Copies
Each person works on their own copy → combine later

### Option C: Git Repository
Use version control for team collaboration

---

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| Can't compile | Check `main.log` for errors |
| No bibliography | Add citations: `\textcite{key}` |
| Missing graphics | Ensure `AAUgraphics/` folder exists |
| Script won't run | `chmod +x scripts/*.sh` |

**More help:** See [Full Documentation](docs/README.md)

---

## 📞 Support

- **Template Issues:** Check docs/README.md
- **LaTeX Questions:** https://tex.stackexchange.com/
- **Overleaf Help:** https://www.overleaf.com/learn

---

## 🎓 Credits

- **Base Template:** Aalborg University Official Template
- **Inspiration:** AAU P2 Project Template
- **Adapted For:** Agile Software Engineering Exam (Fall 2024)
- **Graphics:** AAU Official Branding

---

## 🚀 TL;DR

```bash
# 1. Edit your info in main.tex (lines 90-105)
# 2. Compile
./scripts/compile.sh

# 3. Edit chapters in chapters/ folder
# 4. Recompile after changes
# 5. Done!
```

---

**Everything is ready. Just add your content and compile! 🎉**

**Good luck with your ASE exam! 🎓✨**
