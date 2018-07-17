\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{md-article}[04/07/2018 Mathieu David's template for articles]

\LoadClass[a4paper, 10pt, fleqn]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nothing yes
% \ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nothing yet

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Languages
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[french,english]{babel}

% Fonts
\RequirePackage[sfdefault]{roboto}
\RequirePackage{fourier}

% Page setup
\RequirePackage{geometry}

% Colors
% The 'table' option provides commands for alternating row colors
\RequirePackage[usenames,dvipsnames,table]{xcolor}

% Titles
\RequirePackage{titlesec}
\RequirePackage{titletoc}

% Headers and footers
\RequirePackage{fancyhdr}

% Tables
\RequirePackage{tabularx}
\RequirePackage{array}

% Links
\RequirePackage{hyperref}
\hypersetup{
	pdftoolbar=false,
	pdfmenubar=true,
	pdffitwindow=false,
	pdfborder={0 0 0},
	pdfcreator=LaTeX,
	colorlinks=true,
	linkcolor=linkColor,
	linktoc=all,
	urlcolor=linkColor,
	citecolor=linkColor,
	filecolor=linkColor,
	breaklinks
}

% No link color for TOC
\let\oldtableofcontents\tableofcontents % Save tableofcontents under another name
\renewcommand{\tableofcontents}{\hypersetup{linkcolor=titleColor}\oldtableofcontents\hypersetup{linkcolor=linkColor}}

% Graphics
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{calc}

% Math
\RequirePackage{amsmath, amsfonts, amssymb}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Common colors
\definecolor{lightGrey}{gray}{0.94}

% Document colors
\definecolor{mainColor}{rgb}{0.7, 0.1, 0.1}
\colorlet{titleColor}{black}
\colorlet{linkColor}{blue}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Page setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use A4 paper with slightly smaller margins than the default
\geometry{a4paper,hscale=0.75,vscale=0.8}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\titlefont\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[LE,RO]{\titlefont\titleshape\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[RE]{\titlefont\titleshape\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[LO]{\titlefont\titleshape\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page in cyan.
\renewcommand*\sectionmark[1]{\markright{\thesection.\ \color{titleColor}#1}}
\newcommand*\setheader[1]{\markboth{\color{titleColor}#1}{\color{titleColor}#1}}


%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{titleColor}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{titleColor}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\largetitlefont{\fontfamily{Roboto-LF}}
\def\largetitleseries{\fontseries{t}}
\def\largetitleshape{\fontshape{n}}
\def\largetitlestyle{\largetitlefont\largetitleseries\largetitleshape}
\def\titleshape{\fontshape{n}}

\renewcommand{\familydefault}{\rmdefault}
\def\titlefont{\fontfamily{fla}}
\def\sectitleshape{\fontshape{n}}
\def\sectitlestyle{\rmfamily\titleshape\bfseries}%{\familydefault\bfseries}
\def\chaptitlestyle{\rmfamily\titleshape}

\def\headerstyle{\titlefont}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Titles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright}
    {\fontsize{\@largetitlesize}{\@largetitlesize}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{titleColor}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
    {\flushright\largetitlestyle}
    {\fontsize{96}{96}\selectfont\thechapter}
    {0pt}
    {\chaptitlestyle\Huge\color{titleColor}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is
%% preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large\sectitlestyle}
    {\bfseries\thesection.\ }
    {0pt}
    {\color{titleColor}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
%% font.
\titleformat{\subsection}
    {\large\sectitlestyle}
    {\bfseries\thesubsection.\ }
    {0pt}
    {\color{titleColor}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.
\titleformat{\subsubsection}
    {\headerstyle}
    {}
    {0pt}
    {\color{titleColor}}
%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alternating colors
\rowcolors{1}{white}{lightGrey}

% Headers
\newcommand{\header}[1]{%
	\cellcolor{mainColor}%
	{\color{white} \bfseries \textsf{#1} }
}

% Padding
\renewcommand{\arraystretch}{2}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{titleColor}\textbullet}
\renewcommand*\labelitemii{\color{titleColor}--}
\renewcommand*\labelitemiii{\color{titleColor}$\diamond$}
\renewcommand*\labelitemiv{\color{titleColor}\textperiodcentered}