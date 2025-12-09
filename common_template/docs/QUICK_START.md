# 🚀 QUICK START GUIDE

Get your AAU template running in 5 minutes!

## Step 1: Choose Your Method

### 🌐 Option A: Overleaf (Easiest - Recommended for Beginners)

1. **Go to Overleaf**: https://www.overleaf.com
2. **Sign up** for a free account (if you don't have one)
3. **Create New Project** → Click "Upload Project"
4. **Zip the common_template folder** and upload it
5. **Set Main Document**:
   - Click "Menu" (top left)
   - Find "Main document" dropdown
   - Select `main.tex`
6. **Click "Recompile"**
7. **Done!** Your PDF appears on the right

### 💻 Option B: Local Computer (For Advanced Users)

#### On macOS:
```bash
# 1. Install MacTeX (if not installed)
# Download from: https://www.tug.org/mactex/

# 2. Navigate to the template
cd /Users/jawadmehmoodkhanqayyum/Documents/latex-ase/common_template

# 3. Compile
./scripts/compile.sh
```

#### On Linux:
```bash
# 1. Install TeX Live (if not installed)
sudo apt-get install texlive-full

# 2. Navigate to the template
cd path/to/common_template

# 3. Compile
./scripts/compile.sh
```

#### On Windows:
```bash
# 1. Install MiKTeX from: https://miktex.org/

# 2. Open Git Bash or PowerShell in the template folder

# 3. Run:
bash scripts/compile.sh
```

---

## Step 2: Customize Your Information (3 Minutes)

Open `main.tex` and find this section (around line 90):

```latex
% ============================================================================
% DOCUMENT METADATA - EDIT THIS SECTION
% ============================================================================
\title{Agile Software Engineering}
\author{Your Name Here}                    % ← CHANGE THIS
\studentnumber{20XXXXXX}                   % ← CHANGE THIS
\studentemail{xxxx@student.aau.dk}        % ← CHANGE THIS

\intervieweename{Interviewee Name}         % ← CHANGE THIS
\intervieweecompany{Company Name}          % ← CHANGE THIS
\intervieweeemail{interviewee@company.com} % ← CHANGE THIS

\projectperiod{2024}
\semester{Fall 2024}
```

**Replace the text** with your actual information!

---

## Step 3: Test Compilation (1 Minute)

### On Overleaf:
- Just click "Recompile"
- PDF should appear on the right

### On Local Computer:
```bash
./scripts/compile.sh
```

**Expected Output:**
```
============================================
  AAU LaTeX Compilation Script
  For: main.tex
============================================

📄 Compiling: main.tex

🔨 Step 1/4: First compilation...
   ✅ Success
🔨 Step 2/4: Processing bibliography...
   ✅ Success
🔨 Step 3/4: Second compilation...
   ✅ Success
🔨 Step 4/4: Final compilation...
   ✅ Success

============================================
✅ COMPILATION SUCCESSFUL!

📄 PDF created: main.pdf
📊 File size: 267K
📖 Pages: 15
```

---

## Step 4: Add Your Content (Ongoing)

### Edit Chapter Files

Navigate to the `chapters/` folder and edit these files:

```
chapters/
├── 01_introduction.tex              ← Edit your introduction
├── 02_problem_identification.tex    ← Edit your problem analysis
├── 03_agile_solutions.tex          ← Edit your solutions
├── 04_agile_evaluation.tex         ← Edit your evaluation
├── 05_stakeholder_mapping.tex      ← Edit your stakeholder analysis
├── 06_software_quality.tex         ← Edit quality section
├── 07_production_pipeline.tex      ← Edit pipeline section
├── 08_conclusion.tex               ← Edit your conclusion
└── appendix.tex                    ← Interview questions (ready)
```

**Simple workflow:**
1. Open a chapter file (e.g., `01_introduction.tex`)
2. Find the placeholder comments like `% Your content here`
3. Replace with your actual content
4. Save
5. Recompile

---

## Step 5: Add Images (If Needed)

### 1. Add image to figures folder
```
figures/
└── your_image.png  ← Put your image here
```

### 2. Include in your chapter file
```latex
\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/your_image.png}
    \caption{Description of your image}
    \label{fig:my-image}
\end{figure}
```

### 3. Reference it in text
```latex
As shown in Figure \ref{fig:my-image}, we can see...
```

---

## Step 6: Add References

### 1. Add to references.bib
```bibtex
@article{russo2024,
    title={The Agile Success Model},
    author={Russo, Daniel},
    year={2024},
    howpublished={Aalborg University Copenhagen}
}
```

### 2. Cite in your text
```latex
According to \textcite{russo2024}, Agile practices...

Multiple sources support this \parencite{russo2024,schwaber2020scrum}.
```

---

## ✅ Checklist

Before you start writing, make sure:

- [ ] You can compile the template successfully
- [ ] Your name and student info appear on the cover page
- [ ] The table of contents is clickable
- [ ] You can edit chapter files and see changes
- [ ] You understand the folder structure

---

## 🐛 Common Issues & Quick Fixes

### Issue: "Cannot find file AAUgraphics/..."
**Fix:** Make sure the `AAUgraphics/` folder is in the `common_template/` directory

### Issue: Bibliography not showing
**Fix:**
1. Add at least one citation in your text: `\textcite{reference_key}`
2. Recompile (it needs to run biber)

### Issue: PDF won't open
**Fix:** There's a compilation error. Check `main.log` for details

### Issue: Changes not appearing
**Fix:**
- On Overleaf: Click "Recompile"
- Local: Run `./scripts/compile.sh` again

### Issue: Script won't run (permission denied)
**Fix:**
```bash
chmod +x scripts/*.sh
```

---

## 📖 What You Should See

### After First Compilation:

**Page 1 (Cover):**
- Your name in tables
- Interviewee info in tables
- AAU logo top right
- Blue "2024" box
- "EXAM ASSIGNMENT" title

**Page 2 (Synopsis):**
- AAU logo top left
- Document metadata
- Synopsis text
- "AALBORG UNIVERSITY" header

**Page 3 (Table of Contents):**
- Clickable chapter links
- Page numbers
- All 8 chapters listed
- Appendix listed

**Page 4+ (Content):**
- Chapter 1: Introduction
- With sections and subsections
- Placeholder text (for you to replace)

**Last Pages:**
- Bibliography
- Appendix with interview questions

---

## 💡 Pro Tips

### Tip 1: Compile Often
Compile after every major change to catch errors early.

### Tip 2: Use Labels
Label everything for easy cross-referencing:
```latex
\section{Introduction}
\label{sec:intro}

% Later:
As mentioned in Section \ref{sec:intro}...
```

### Tip 3: Clean Regularly
```bash
./scripts/clean.sh
```
This removes temporary files and keeps your folder tidy.

### Tip 4: Comment Your Code
```latex
% TODO: Add more details here
% NOTE: This section needs revision
```

### Tip 5: Use Version Control
- Overleaf has built-in version history
- Or use Git for local files

---

## 🤝 Working With a Friend

### Option A: Shared Overleaf Project
1. One person creates the project
2. Click "Share" button in Overleaf
3. Send link to friend
4. Both can edit simultaneously

### Option B: Git Repository
```bash
cd common_template
git init
git add .
git commit -m "Initial template"
# Push to GitHub and share
```

### Option C: Work on Different Chapters
- Person A: chapters 1-4
- Person B: chapters 5-8
- Combine later

---

## 📞 Need More Help?

**For detailed information:**
- Read `docs/README.md` - Complete documentation
- LaTeX questions: https://tex.stackexchange.com/
- Overleaf help: https://www.overleaf.com/learn

**For quick questions:**
- Check the main README
- Search Google with error message
- Ask in Overleaf forums

---

## 🎯 Next Steps

1. ✅ **Done with setup?** → Start writing in chapter files
2. ✅ **Added content?** → Add your references
3. ✅ **Ready to submit?** → Check the submission checklist in README.md

---

**You're all set! Happy writing! 🎓✨**
