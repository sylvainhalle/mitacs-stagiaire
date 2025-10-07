%% --------------------------------------------------------------------------
%% Profil de nouveau stagiaire
%%
%% mitacs-stagiaire.cls
%% Copyright 2025 Sylvain Hallé
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Sylvain Hallé.
%%
%% This work consists of the file mitacs-stagiaire.cls.
%%
%% Version: 1.0, last modified 2025-10-05
%% --------------------------------------------------------------------------

%% ------------------------
%% Déclarations
%% ------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mitacs-stagiaire}[2025/10/06, Profil de nouveau stagiaire Mitacs V1.0 par Sylvain Hallé]

%% ------------------------
%% Vérifie qu'on compile avec lualatex
%% ------------------------
\newif\ifluatexengine
\ifdefined\directlua
  \luatexenginetrue
\else
  \luatexenginefalse
\fi
\ifluatexengine
  % LuaLaTeX detected: continue
\else
  \ClassError{myclass}{This class requires LuaLaTeX}
    {%
      You are not using LuaLaTeX.\MessageBreak
      Please compile with "lualatex" instead.\MessageBreak
      For example: lualatex yourfile.tex%
    }
\fi

%% ------------------------
%% Passage des autres options à la classe book
%% ------------------------
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions
\LoadClass[10pt]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{fontspec}
\RequirePackage{microtype}
\RequirePackage[french]{babel}
\RequirePackage[usegeometry,paper=8.5in:11in]{typearea}% load before geometry
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage[x11names]{xcolor}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{lastpage}
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{stmaryrd}
\RequirePackage{luacode}
\RequirePackage{colortbl}
\RequirePackage[document]{ragged2e}
\RequirePackage[some]{background}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{arydshln}
\RequirePackage{tabularx}
\RequirePackage{multirow}

\newcommand\changepapersize[1]{%
  \cleardoublepage
  \KOMAoptions{paper=#1,DIV=last}%
  \newgeometry{margin=1in,footskip=0.5in}%
}
\AtBeginDocument{\storeareas\defaultareasettings}
\BeforeRestoreareas{\clearpage}

%% Formatage
\renewcommand\familydefault{\sfdefault}
\setlength{\parindent}{0pt}
\setlength{\parskip}{10pt}
\makeatletter
\renewcommand{\maketitle}{%
\begin{center}
  \urwgothic\LARGE\bfseries\color{white}\@title
\end{center}
}
\makeatother
% Set Carlito as the default sans font
\setsansfont{Carlito} % a free Calibri-like font

% \newfontfamily{\questasansbold}{Questa_Sans_Bold}
% [Path=./fonts/, Extension = .otf, UprightFont = *]
\newfontfamily{\urwgothic}{URW Gothic}

%% Environnements custom
\newenvironment{instructions}{\itshape\small\color{gray}}{}
\definecolor{lebleu}{HTML}{005FAF}
\definecolor{darkred}{HTML}{A52A2A}
\titleformat{\section}
  {\bfseries\normalsize}{\thesection.0}{1em}{}
\titleformat{\subsection}
  {\bfseries}{\thesubsection}{1em}{}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\newcommand{\tabitem}[1]{\hdashline \stepcounter{subsection}\small\textbf{\thesubsection{} #1}}
\newcommand{\tabtabitem}[1]{\hdashline \small\textbf{\thesubsection{} #1}}
\newcommand{\tabnoitem}[1]{\hdashline \small\textbf{#1}}
\newenvironment{tabdonnees}{\arrayrulecolor{black!20}\begin{tabular}{:m{3in}:m{3in}:}}{\hdashline \end{tabular}}
\newenvironment{tabsignatures}{\arrayrulecolor{black!20}\begin{tabular}{:m{1.5in}:m{2.25in}:m{2.25in}:}}{\hdashline \end{tabular}}
\newcommand{\tabsigitem}[1]{\hdashline \textbf{#1}}
\newcommand{\tabsigitemdbl}[1]{\hdashline \multicolumn{2}{c}{#1}}

\newcommand{\oblig}{{\color{red}*}}
% Define layout: like a \item with hanging indent
\titleformat{\subsubsection}[hang]
  {\normalfont\bfseries}  % style of label + text
  {\thesubsubsection}     % what to print before the title
  {1em}                   % spacing between label and title text
  {}                      % code before the title body
  []                      % code after the title

% Hanging indent so the whole paragraph aligns under the title text
\titlespacing*{\subsubsection}
  {0pt}           % left margin
  {1ex plus .2ex} % vertical space before
  {0pt}    % horizontal space after (unused for runin)

% Add hanging indent after each subsubsection
\makeatletter
\let\old@subsubsection\subsubsection
\renewcommand{\subsubsection}[1]{%
  \old@subsubsection{#1}%
  \hangindent=1in
}
\makeatother

\fancypagestyle{plain}
{
  \fancyhead[L,C,R]{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[C]{}
  \fancyfoot[R]{\footnotesize\textbf{Version la plus récente Mars 2025~~~~~~\thepage} de \textbf{\pageref{LastPage}}}
}

\pagestyle{fancy}
\fancyhead[L,C,R]{}
\fancyfoot[L]{\includegraphics[height=0.35in]{mitacsbleu}\\ \color{lebleu}\textbf{\textsl{NIPF-Acc-fr-2025.04\_V2}}}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{}
\fancyfoot[R]{\color{lebleu}\footnotesize Page \thepage{} de \pageref{LastPage}}

\newcommand{\mitacsheader}{%
\SetBgScale{1}
\SetBgOpacity{1}
\SetBgAngle{0}
\SetBgContents{\includegraphics[width=8.5in]{entete}}
\BgThispage
}

\newcommand{\tolandscape}{%
\changepapersize{8.5in:14in}
\KOMAoptions{paper=landscape,DIV=current}%switch to landscape
\newgeometry{left=1in,right=1in}
}

\newcommand{\toportrait}{%
\changepapersize{8.5in:11in}
\KOMAoptions{paper=portrait,DIV=current}%switch to landscape
\restoregeometry
}

\renewcommand{\arraystretch}{1.3}
\newcommand{\tispace}{\vskip 1pt}
%% :wrap=soft:mode=latex: