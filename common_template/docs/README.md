# AAU LaTeX Template for Agile Software Engineering Exam

Professional LaTeX template based on Aalborg University's official template structure, specifically adapted for the ASE exam assignment.

## 📁 Project Structure

```
common_template/
├── main.tex                    # Main LaTeX file (EDIT THIS)
├── aau.cls                     # Custom AAU document class
├── references.bib              # Bibliography file
│
├── chapters/                   # Chapter files
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
├── figures/                    # Put your images here
├── AAUgraphics/               # AAU logos and graphics (DO NOT DELETE)
├── scripts/                    # Compilation scripts
│   ├── compile.sh             # Compile the document
│   └── clean.sh               # Clean auxiliary files
└── docs/                       # Documentation
    ├── README.md              # This file
    └── QUICK_START.md         # Quick start guide
```

## 🚀 Quick Start

### Method 1: Using Overleaf (Easiest)

1. Go to https://www.overleaf.com
2. Create a new blank project
3. Upload the entire `common_template` folder
4. Set "Main document" to `main.tex` in Overleaf menu
5. Click "Recompile"

### Method 2: Local Compilation

```bash
cd common_template
./scripts/compile.sh
```

## ✏️ Customizing Your Document

### 1. Edit Document Metadata

Open `main.tex` and edit these lines (around line 90-105):

```latex
\title{Agile Software Engineering}
\author{Your Name Here}
\studentnumber{20XXXXXX}
\studentemail{xxxx@student.aau.dk}

\intervieweename{Interviewee Name}
\intervieweecompany{Company Name}
\intervieweeemail{interviewee@company.com}

\projectperiod{2024}
\semester{Fall 2024}
```

### 2. Edit Chapter Content

Each chapter is in its own file in the `chapters/` folder:

- `01_introduction.tex` - Introduction
- `02_problem_identification.tex` - Problem analysis
- `03_agile_solutions.tex` - Solutions and team dynamics
- `04_agile_evaluation.tex` - Process evaluation
- `05_stakeholder_mapping.tex` - Stakeholder management
- `06_software_quality.tex` - Quality and technology
- `07_production_pipeline.tex` - Pipeline and recommendations
- `08_conclusion.tex` - Conclusion
- `appendix.tex` - Interview questions

Simply open each file and replace the placeholder text with your content.

### 3. Add References

Add your references to `references.bib` in BibTeX format:

```bibtex
@article{author2024,
    title={Article Title},
    author={Author, First},
    journal={Journal Name},
    year={2024}
}
```

Then cite in your text:
```latex
According to \textcite{author2024}...
Multiple sources \parencite{author2024,another2024}...
```

### 4. Add Images

1. Put your images in the `figures/` folder
2. Include in your document:

```latex
\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/your_image.png}
    \caption{Your caption here}
    \label{fig:your-label}
\end{figure}

% Reference it:
As shown in Figure \ref{fig:your-label}...
```

## 📝 Features

✅ **Professional AAU styling** - Official AAU template structure
✅ **Beautiful cover page** - With student and interviewee info tables
✅ **Synopsis page** - Metadata and abstract page
✅ **Clickable Table of Contents** - Full navigation support
✅ **Modular chapters** - Each chapter in separate file
✅ **Bibliography management** - BibLaTeX with modern citation styles
✅ **Code listings** - Syntax highlighting for JavaScript and more
✅ **Proper formatting** - No text overflow, professional margins
✅ **AAU Graphics** - Official AAU logos and branding

## 🎨 Customization

### Change Colors

Edit `aau.cls` (line 24-25):
```latex
\definecolor{aaublue}{RGB}{33,26,82}
\definecolor{aaulight}{RGB}{0,157,224}
```

### Change Margins

Edit `main.tex` (line 13):
```latex
\usepackage[left=2.5cm, right=2.5cm, top=2.5cm, bottom=2.5cm]{geometry}
```

### Change Line Spacing

Edit `main.tex` (line 17-18):
```latex
\onehalfspacing  % Options: \singlespacing, \onehalfspacing, \doublespacing
```

## 🔧 Compilation

### Automatic (Recommended)

```bash
./scripts/compile.sh
```

This runs all necessary steps and opens the PDF.

### Manual

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

### Clean Auxiliary Files

```bash
./scripts/clean.sh
```

## 📚 Document Structure

The template uses the AAU report class which provides:

### Frontmatter
- Cover page (`\maketitle`)
- Synopsis/metadata page (`\makesynopsispage`)
- Table of contents
- List of figures/tables (optional)
- Uses Roman numerals (i, ii, iii...)

### Mainmatter
- Main content chapters
- Uses Arabic numerals (1, 2, 3...)

### Appendix
- Interview questions
- Additional material

## 💡 Tips for Writing

### Sections and Subsections

```latex
\chapter{Chapter Title}         % Top level
\section{Section Title}          % Second level
\subsection{Subsection Title}    % Third level
\subsubsection{Subsubsection}    % Fourth level
```

### Cross-References

```latex
\label{sec:intro}                % Label a section
See Section \ref{sec:intro}...   % Reference it
```

### Lists

**Bullet points:**
```latex
\begin{itemize}
    \item First item
    \item Second item
\end{itemize}
```

**Numbered:**
```latex
\begin{enumerate}
    \item First item
    \item Second item
\end{enumerate}
```

### Tables

```latex
\begin{table}[h]
    \centering
    \caption{Your caption}
    \label{tab:label}
    \begin{tabular}{|l|c|r|}
        \hline
        Left & Center & Right \\
        \hline
        Data & Data & Data \\
        \hline
    \end{tabular}
\end{table}
```

### Code Listings

```latex
\begin{lstlisting}[language=JavaScript, caption={Code example}]
function hello() {
    console.log("Hello World!");
}
\end{lstlisting}
```

## 🐛 Troubleshooting

### "Cannot find AAU graphics"
**Solution:** Make sure the `AAUgraphics/` folder is in the same directory as `main.tex`

### Bibliography not showing
**Solution:**
1. Make sure you have references in `references.bib`
2. Cite at least one reference in your document
3. Run compilation script (it runs biber automatically)

### Compilation errors
**Solution:**
1. Check `main.log` for detailed error messages
2. Make sure all chapter files exist in `chapters/` folder
3. Verify all `\include{}` paths are correct

### "Undefined control sequence"
**Solution:** Missing LaTeX package. Install full TeX distribution:
- **macOS:** MacTeX
- **Windows:** MiKTeX
- **Linux:** texlive-full

## 📞 Getting Help

- **LaTeX Questions:** https://tex.stackexchange.com/
- **Overleaf Help:** https://www.overleaf.com/learn
- **BibLaTeX Guide:** https://www.overleaf.com/learn/latex/Bibliography_management_with_biblatex

## 📄 Requirements

### Software
- **LaTeX Distribution:**
  - macOS: MacTeX (https://www.tug.org/mactex/)
  - Windows: MiKTeX (https://miktex.org/)
  - Linux: TeX Live (`sudo apt-get install texlive-full`)
- **Bibliography Processor:** Biber (included in distributions)
- **PDF Reader:** Any (Adobe, Preview, Evince, etc.)

### Packages
All required packages are automatically loaded by the template:
- `tikz` - Graphics and cover page
- `hyperref` - Clickable links
- `biblatex` - Bibliography management
- `listings` - Code syntax highlighting
- `graphicx` - Image inclusion
- And more...

## ✅ Before Final Submission

- [ ] All student/interviewee information is correct
- [ ] All chapters have content (no placeholders)
- [ ] All references are cited and appear in bibliography
- [ ] All figures have captions and are referenced in text
- [ ] All tables have captions and are referenced in text
- [ ] No compilation errors or warnings
- [ ] Table of contents is complete
- [ ] Page numbers are correct
- [ ] PDF opens and displays correctly

## 🎓 Credits

- **Template Base:** Aalborg University Official Template
- **Adapted for:** Agile Software Engineering Exam (Fall 2024)
- **Graphics:** AAU Official Branding

---

**Good luck with your exam! 🎉**
