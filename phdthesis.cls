%%
%% phdthesis.cls
%% 
%% This file is part of the phd_thesis_template distribution available on
%% GitHub https://github.com/akdiem/phd_thesis_template
%%
%% To install this file run
%%
%% cp ecsthesis.cls ~/texmf/tex/latex/
%% texhash ~/texmf
%% 
%% Copyright (C) 2017 by Alexandra K. Diem
%% 
%% Licence: BSD 3-Clause
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdthesis}[2017/02/02 PhD Thesis Class]
\def\baseclass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{10pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year}
\usepackage{graphicx}
\usepackage{setspace}
\onehalfspacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}
\usepackage{vmargin}
\setmarginsrb           { 1.5in}  % left margin
                        { 0.6in}  % top margin
                        { 1.0in}  % right margin
                        { 0.8in}  % bottom margin
                        {  20pt}  % head height
                        {0.25in}  % head sep
                        {   9pt}  % foot height
                        { 0.3in}  % foot sep
\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.
\usepackage{fancyhdr}
\lhead[\rm\thepage]{\fancyplain{}{\sl{\rightmark}}}
\rhead[\fancyplain{}{\sl{\leftmark}}]{\rm\thepage}
\chead{}\lfoot{}\rfoot{}\cfoot{}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\btypeout{\thechapter\space #1}\markboth{\@chapapp\ \thechapter\ #1}{\@chapapp\ \thechapter\ #1}}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
\theoremstyle{plain}
\newtheorem{example}{Example}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{axiom}[theorem]{Axiom}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\usepackage[centerlast,small,sc]{caption}
\setlength{\captionmargin}{20pt}
\newcommand{\fref}[1]{Figure~\ref{#1}}
\newcommand{\tref}[1]{Table~\ref{#1}}
\newcommand{\eref}[1]{Equation~\ref{#1}}
\newcommand{\cref}[1]{Chapter~\ref{#1}}
\newcommand{\sref}[1]{Section~\ref{#1}}
\newcommand{\aref}[1]{Appendix~\ref{#1}}
\newcommand{\alref}[1]{Algorithm~\ref{#1}}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}
\usepackage{listings}
\lstset{captionpos=b,
        frame=tb,
        basicstyle=\scriptsize\ttfamily,
        showstringspaces=false,
        keepspaces=true}
\lstdefinestyle{matlab} {
        language=Matlab,
        keywordstyle=\color{blue},
        commentstyle=\color[rgb]{0.13,0.55,0.13}\em,
        stringstyle=\color[rgb]{0.7,0,0} }
\usepackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   linkcolor={black},citecolor={black},urlcolor={black},
   pdfstartview={FitV},unicode,breaklinks=true]{hyperref}
\pdfstringdefDisableCommands{
   \let\\\space
}

\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\university}[1]{\gdef\@university{#1}}
\newcommand*{\UNIVERSITY}{\MakeUppercase\@university}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\DEPARTMENT}{\MakeUppercase\@department}
\newcommand*{\group}[1]{\gdef\@group{#1}}
\newcommand*{\GROUP}{\MakeUppercase\@group}
\newcommand*{\faculty}[1]{\gdef\@faculty{#1}}
\newcommand*{\FACULTY}{\MakeUppercase\@faculty}
\newcommand*{\addresses}[1]{\@group\\\@department\\\@university}
\newcommand*{\atitle}[1]{\gdef\@title{#1}}

\renewcommand\maketitle{
  \btypeout{Title Page}
  \hypersetup{pdftitle={\@title}}
  \hypersetup{pdfauthor={\@author}}
  \thispagestyle{empty}
  \begin{titlepage}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \setcounter{footnote}{0}
    \null\vfill
    \vskip 60\p@
    \begin{center}
      \setlength{\parskip}{0pt}
      {\large\textbf{\UNIVERSITY}\par}
      \vfill
      {\huge \bf \@title \par}
      \vfill
      {\LARGE by \par}
      \smallskip
      {\LARGE \@author \par}
      \vfill
      {\large A thesis submitted for the degree of \par}
      {\large Doctor of Philosophy \par}
      \bigskip
      \bigskip
      {\large in the \par}
      {\large \@faculty\par \par}
      {\large \@department\par \par}
      \bigskip
      \bigskip
      \bigskip
      {\Large \@date \par}
      \bigskip
    \end{center}
    \par
    \@thanks
    \vfil\null
  \end{titlepage}
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \cleardoublepage
}
\newenvironment{abstract}
{
  \btypeout{Abstract Page}
  \thispagestyle{empty}
  \null\vfil
  \begin{center}
    \setlength{\parskip}{0pt}
    {\normalsize \UNIVERSITY \par \par}
    {\underline{ABSTRACT} \par \par}
    \bigskip
    {\normalsize \FACULTY\par \par}
    {\normalsize \DEPARTMENT\par \par}
    \bigskip
    {\normalsize \underline{Doctor of Philosophy}\par \par}
    \bigskip
    {\normalsize\bf\MakeUppercase \@title \par \par}
    \medskip
    {\normalsize by \@author \par \par}
    \bigskip
  \end{center}
}
{
  \vfil\vfil\vfil\null
  \cleardoublepage
}
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcounter{dummy}
\newcommand\addtotoc[1]{
\refstepcounter{dummy}
\addcontentsline{toc}{chapter}{#1}}
\renewcommand\tableofcontents{
\btypeout{Table of Contents}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
   \cleardoublepage
}\end{spacing}
}
\renewcommand\listoffigures{
\btypeout{List of Figures}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \addtotoc{\listfigurename}
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}
              {\MakeUppercase\listfigurename}}
    \@starttoc{lof}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\renewcommand\listoftables{
\btypeout{List of Tables}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \addtotoc{\listtablename}
    \chapter*{\listtablename
      \@mkboth{
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
    \@starttoc{lot}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\renewcommand{\lstlistingname}{Algorithm}
\renewcommand{\lstlistlistingname}{List of Algorithms}
\renewcommand\lstlistoflistings{
\btypeout{List of Algorithms}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \addtotoc{\lstlistlistingname}
    \chapter*{\lstlistlistingname
      \@mkboth{
          \MakeUppercase\lstlistlistingname}{\MakeUppercase\lstlistlistingname}}
    \@starttoc{lol}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\newcommand\listsymbolname{Nomenclature}
\usepackage{longtable}
\newcommand\listofsymbols[2]{
\btypeout{\listsymbolname}
\addtotoc{\listsymbolname}
    \chapter*{\listsymbolname
      \@mkboth{
          \MakeUppercase\listsymbolname}{\MakeUppercase\listsymbolname}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
\cleardoublepage
}
\newcommand\listacronymname{Acronyms}
\usepackage{longtable}
\newcommand\listofacronyms[2]{
\btypeout{\listacronymname}
\addtotoc{\listacronymname}
    \chapter*{\listacronymname
      \@mkboth{
          \MakeUppercase\listacronymname}{\MakeUppercase\listacronymname}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
    \cleardoublepage
}
\newcommand\declarationname{Declaration of Authorship}
\newcommand\declaration[1]{
\btypeout{\declarationname}
\addtotoc{\declarationname}
    \chapter*{
      \@mkboth{
          \MakeUppercase\declarationname}{\MakeUppercase\declarationname}}
\thispagestyle{plain}
\null
\vskip 60\p@
\begin{center}{\Large\bf \declarationname \par}\end{center}
{\normalsize 
I, \@author, declare that this thesis entitled \@title\xspace and the work presented in it are my own and has been generated by me as the result of my own original research.

I confirm that:

\begin{enumerate}
\item This work was done wholly or mainly while in candidature for a research degree at this University;
\item Where any part of this thesis has previously been submitted for a degree or any other qualification at this University or any other institution, this has been clearly stated;
\item Where I have consulted the published work of others, this is always clearly attributed;
\item Where I have quoted from the work of others, the source is always given. With the exception of such quotations, this thesis is entirely my own work;
\item I have acknowledged all main sources of help;
\item Where the thesis is based on work done by myself jointly with others, I have made clear exactly what was done by others and what I have contributed myself;
\item Either none of this work has been published before submission, or parts of this work have been published as: #1.
\end{enumerate}

Signed:

Date:

}
\cleardoublepage
}
\newcommand\acknowledgementsname{Acknowledgements}
\newcommand\acknowledgements[1]{
\btypeout{\acknowledgementsname}
\addtotoc{\acknowledgementsname}
    \chapter*{
      \@mkboth{
          \MakeUppercase\acknowledgementsname}{\MakeUppercase\acknowledgementsname}}
\thispagestyle{plain}
\null
\vskip 60\p@
\begin{center}{\Large\bf \acknowledgementsname \par}\end{center}
{\normalsize #1}
\cleardoublepage
}
%\newcommand\dedicatory[1]{
%\btypeout{Dedicatory}
%\thispagestyle{plain}
%\null\vfil
%\vskip 60\p@
%\begin{center}{\Large \sl #1}\end{center}
%\vfil\null
%\cleardoublepage
%}
%\renewcommand\backmatter{
%  \if@openright
%    \cleardoublepage
%  \else
%    \clearpage
%  \fi
%  \addtotoc{\bibname}
%  \btypeout{\bibname}
%  \@mainmatterfalse}
%\endinput
