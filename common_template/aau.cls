\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aau_v2}[2025/12/09 AAU Report Class - Editorial Design]

\LoadClassWithOptions{report}

\RequirePackage{tikz}
\RequirePackage{xstring}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{babel}
\RequirePackage{lastpage}
\RequirePackage{fontawesome5}
\RequirePackage{geometry}
\RequirePackage{etoolbox}
\usetikzlibrary{calc,positioning,shapes.geometric}
\usepackage{pdfpages}

\newif\ifdanish
\newif\ifcph

\DeclareOption{danish}{\danishtrue}
\DeclareOption{cph}{\cphtrue}

\ProcessOptions\relax

% AAU Colors
\definecolor{aaublue}{RGB}{33,26,82}
\definecolor{aaulight}{RGB}{0,157,224}
\definecolor{aaugray}{RGB}{89,89,91}
\definecolor{aausilver}{RGB}{241,242,242}

% Logo paths
\def\roundlogo{\ifdanish%
  AAUgraphics/aau_logo_circle_da%
  \else%
  AAUgraphics/aau_logo_circle_en%
  \fi
}

\def\squarelogo{\ifdanish%
  AAUgraphics/aau_logo_da%
  \else%
  AAUgraphics/aau_logo_en%
  \fi
}

% Custom commands for metadata
\def\and{, }
\newcommand{\studentnumber}[1]{\def\@studentnumber{#1}}
\newcommand{\studentemail}[1]{\def\@studentemail{#1}}
\newcommand{\intervieweename}[1]{\def\@intervieweename{#1}}
\newcommand{\intervieweecompany}[1]{\def\@intervieweecompany{#1}}
\newcommand{\intervieweeemail}[1]{\def\@intervieweeemail{#1}}
\newcommand{\projectperiod}[1]{\def\@period{#1}}
\newcommand{\coursename}[1]{\def\@coursename{#1}}
\newcommand{\coursecode}[1]{\def\@coursecode{#1}}
\newcommand{\semester}[1]{\def\@semester{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\synopsis}[1]{\def\@synopsis{#1}}

% Labels
\newcommand{\@titlelab}{\ifdanish Titel\else Title\fi}
\newcommand{\@projectperiodlab}{\ifdanish Projekperiode\else Project period\fi}
\newcommand{\@supervisorlab}{\ifdanish Vejleder\else Supervisor\fi}
\newcommand{\@pageslab}{\ifdanish Antal Sider\else Number of pages\fi}
\newcommand{\@examlab}{\ifdanish EKSAMENSOPGAVE\else EXAM ASSIGNMENT\fi}

% ============================================================================
% EDITORIAL SIDEBAR TITLE PAGE
% ============================================================================
\renewcommand\maketitle{%
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]

    % ========== LEFT SIDEBAR (Dark) ==========
    \fill[aaublue] 
      (current page.north west) rectangle 
      ($(current page.south west)+(6cm,0)$);
    
    % Diagonal accent cut at top of sidebar
    \fill[aaulight] 
      ($(current page.north west)+(0,-3cm)$) --
      ($(current page.north west)+(6cm,-3cm)$) --
      ($(current page.north west)+(6cm,-4.5cm)$) --
      ($(current page.north west)+(0,-3.8cm)$) -- cycle;

    % Logo in sidebar
    \node[anchor=north west] at ($(current page.north west)+(1cm,-0.8cm)$) {
      \includegraphics[height=2cm]{\roundlogo}
    };

    % Vertical "EXAM" text rotated
    \node[
      anchor=south,
      rotate=90,
      text=white,
      font=\fontsize{60}{60}\selectfont\bfseries\sffamily,
      opacity=0.1
    ] at ($(current page.west)+(2.5cm,0)$) {
      EXAM
    };

    % ---------- STUDENT INFO (in sidebar) ----------
    \node[anchor=north west, text=aaulight, font=\small\bfseries\sffamily] 
      at ($(current page.north west)+(1cm,-5.5cm)$) {
      STUDENT
    };
    
    \node[anchor=north west, text=white, font=\normalsize\sffamily, text width=4.5cm] 
      at ($(current page.north west)+(1cm,-6.2cm)$) {
      \textbf{\@author}\\[6pt]
      {\small\faIdCard\hspace{0.2cm}\@studentnumber}\\[3pt]
      {\small\faEnvelope\hspace{0.2cm}\@studentemail}
    };

    % Separator line
    \draw[aaulight, line width=1pt] 
      ($(current page.north west)+(1cm,-9cm)$) -- 
      ($(current page.north west)+(5cm,-9cm)$);

    % ---------- INTERVIEWEE INFO (in sidebar) ----------
    \node[anchor=north west, text=aaulight, font=\small\bfseries\sffamily] 
      at ($(current page.north west)+(1cm,-9.8cm)$) {
      INTERVIEWEE
    };
    
    \node[anchor=north west, text=white, font=\normalsize\sffamily, text width=4.5cm] 
      at ($(current page.north west)+(1cm,-10.5cm)$) {
      \textbf{\@intervieweename}\\[6pt]
      {\small\faBuilding\hspace{0.2cm}\@intervieweecompany}\\[3pt]
      {\small\faEnvelope\hspace{0.2cm}\@intervieweeemail}
    };

    % ---------- PERIOD (bottom of sidebar) ----------
    \node[anchor=south west, text=white, font=\small\sffamily, text width=4.5cm] 
      at ($(current page.south west)+(1cm,1.5cm)$) {
      {\color{aaulight}\faCalendar\hspace{0.2cm}PROJECT PERIOD}\\[4pt]
      \@period
    };

    % ========== MAIN CONTENT AREA (Right side) ==========
    
    % University name - top right
    \node[anchor=north east, text=aaublue, font=\large\bfseries\sffamily] 
      at ($(current page.north east)+(-1.5cm,-1.2cm)$) {
      AALBORG UNIVERSITY
    };
    
    \node[anchor=north east, text=aaugray, font=\small\sffamily] 
      at ($(current page.north east)+(-1.5cm,-2cm)$) {
      \@semester
    };

    % Decorative circles (geometric accent)
    \fill[aausilver] ($(current page.north east)+(-2cm,-5cm)$) circle (1.5cm);
    \fill[aaulight, opacity=0.3] ($(current page.north east)+(-3.5cm,-6cm)$) circle (1cm);
    \fill[aaublue, opacity=0.1] ($(current page.north east)+(-1.2cm,-7cm)$) circle (0.7cm);

    % Course name - large, left-aligned in main area
    \node[anchor=north west, text width=10cm] 
      at ($(current page.north west)+(7.5cm,-8cm)$) {
      {\fontsize{36}{42}\selectfont\bfseries\sffamily\color{aaublue}\@coursename}
    };

    % Accent underline
    \fill[aaulight] 
      ($(current page.north west)+(7.5cm,-12cm)$) rectangle 
      ($(current page.north west)+(12cm,-12.15cm)$);

    % EXAM ASSIGNMENT text
    \node[anchor=north west, text=aaugray, font=\Large\bfseries\sffamily] 
      at ($(current page.north west)+(7.5cm,-13cm)$) {
      \@examlab
    };

    % Large decorative number/year at bottom right
    \node[
      anchor=south east,
      text=aausilver,
      font=\fontsize{120}{120}\selectfont\bfseries\sffamily
    ] at ($(current page.south east)+(-0.5cm,0.5cm)$) {
      25
    };

    % Thin accent line at very bottom of main area
    \fill[aaulight] 
      ($(current page.south west)+(6cm,0)$) rectangle 
      ($(current page.south east)+(0,0.3cm)$);

  \end{tikzpicture}%
  \clearpage
}

% ============================================================================
% SYNOPSIS PAGE
% ============================================================================
\newcommand{\makesynopsispage}{%
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    
    % Thin left accent bar
    \fill[aaublue] 
      (current page.north west) rectangle 
      ($(current page.south west)+(0.5cm,0)$);
    
    % Header line
    \fill[aaulight] 
      ($(current page.north west)+(1in,-1.1in)$) rectangle 
      ($(current page.north east)+(-1in,-1.15in)$);
    
    % Logo
    \node[anchor=north west] at ($(current page.north west)+(1in,-0.4in)$) {
      \includegraphics[height=1.3cm]{\squarelogo}
    };
    
    % University text
    \node[anchor=north east, font=\small\bfseries\sffamily\color{aaublue}] 
      at ($(current page.north east)+(-1in,-0.6in)$) {
      AALBORG UNIVERSITY
    };

    % Left column - Metadata
    \node[anchor=north west, text width=.32\textwidth] (title) 
      at ($(current page.north west)+(1in,-1.5in)$) {
      {\sffamily\color{aaulight}\@titlelab}\\[2pt]
      {\color{aaublue}\@title}
    };

    \node[anchor=north west, text width=.32\textwidth] (period) 
      at ($(title.south west)+(0,-0.6cm)$) {
      {\sffamily\color{aaulight}\@projectperiodlab}\\[2pt]
      {\color{aaublue}\@period}
    };

    \node[anchor=north west, text width=.32\textwidth] (author) 
      at ($(period.south west)+(0,-0.6cm)$) {
      {\sffamily\color{aaulight}Student}\\[2pt]
      {\color{aaublue}\@author}
    };

    \node[anchor=north west, text width=.32\textwidth] (semester) 
      at ($(author.south west)+(0,-0.6cm)$) {
      {\sffamily\color{aaulight}Semester}\\[2pt]
      {\color{aaublue}\@semester}
    };

    \ifdef{\@supervisor}{
      \node[anchor=north west, text width=.32\textwidth] (supervisors) 
        at ($(semester.south west)+(0,-0.6cm)$) {
        {\sffamily\color{aaulight}\@supervisorlab}\\[2pt]
        {\color{aaublue}\StrSubstitute{\@supervisor}{\and}{\\}}
      };
      \node[anchor=north west, text width=.32\textwidth] 
        at ($(supervisors.south west)+(0,-0.6cm)$) {
        {\sffamily\color{aaulight}\@pageslab}\\[2pt]
        {\color{aaublue}\pageref{LastPage}}
      };
    }{
      \node[anchor=north west, text width=.32\textwidth] 
        at ($(semester.south west)+(0,-0.6cm)$) {
        {\sffamily\color{aaulight}\@pageslab}\\[2pt]
        {\color{aaublue}\pageref{LastPage}}
      };
    }

    % Right column - Synopsis
    \ifdef{\@synopsis}{
      \node[
        anchor=north west,
        text width=.52\textwidth,
        draw=aaulight,
        line width=1pt,
        rounded corners=4pt,
        inner sep=12pt
      ] at ($(title.north east)+(0.8cm,0)$) {
        {\sffamily\bfseries\color{aaublue}Synopsis}\\[6pt]
        {\color{aaugray}\@synopsis}
      };
    }{}

    % Address
    \node[anchor=north east, text width=.28\textwidth, font=\small\sffamily\color{aaugray}, align=right] 
      at ($(current page.north east)+(-1in,-1.25in)$) {
      \@address
    };

  \end{tikzpicture}%
  \clearpage
}

% ============================================================================
% CODE LISTINGS
% ============================================================================
\definecolor{mGreen}{rgb}{0,0.6,0}
\definecolor{mGray}{rgb}{0.5,0.5,0.5}
\definecolor{mPurple}{rgb}{0.58,0,0.82}
\definecolor{backgroundColour}{rgb}{0.97,0.97,0.97}

\lstset{
    backgroundcolor=\color{backgroundColour},
    commentstyle=\color{mGreen},
    keywordstyle=\color{aaublue}\bfseries,
    numberstyle=\tiny\color{mGray},
    stringstyle=\color{mPurple},
    basicstyle=\footnotesize\ttfamily,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=8pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    frame=single,
    framerule=0pt,
    xleftmargin=15pt,
    framexleftmargin=15pt
}

% Frontmatter and mainmatter commands
\newcommand{\frontmatter}{
  \pagenumbering{roman}
  \cleardoublepage
}

\newcommand{\mainmatter}{
  \cleardoublepage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}