\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancymemoir}[2022 Enric's modified memoir class]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions

% Load LaTeX's article class with the `titlepage' option so that \maketitle creates a title page, not just a title block
\LoadClass[twocolumn,12pt]{memoir} %default is letter format, but could switch to a4paper with minimal impact

% Redefine the page margins
% TODO: Adjust margins to your liking
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% two pages per page
%\usepackage{pgfpages} 
%\pgfpagesuselayout{2 on 1}[a4paper,landscape]

%Packages to layout pages
\usepackage{tikz}
\usepackage{environ}

% Two page default layout
\usepackage{ragged2e}
\usepackage{xparse}
\RequirePackage{fancyhdr}
\fancypagestyle{twocolumn}{%
	\twocolumn
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Chapters, sections, etc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[explicit]{titlesec}

% Part formatting - font done in fonts.tex


% Chapter formatting
\usepackage{blindtext, color}
\definecolor{gray75}{gray}{0.75}
\newcommand{\hsp}{\hspace{20pt}}
\titleformat{\chapter}[hang]{\Huge\bfseries}{\thechapter\hsp\textcolor{gray75}{|}\hsp}{0pt}{#1}



%Section headers


\newcommand{\titlebar}{
	\tikz[baseline,trim left=2.4cm,trim right=3cm] {
		\node [anchor=base east,
		minimum height=3.5ex,
		fill=DarkGray,
		text=white] at (3cm,0) {\thesection};
	}
}
%\titleformat{\section}{\large\bfseries\HeadingsFont}{\titlebar}{0.1cm}{\MakeUppercase}
\newlength\widestnum
\setlength\widestnum{2.5em}

% change spacing before to avoid forced cuts to the next column
\titlespacing*{\section}{0cm}{5pt}{5pt}

\titleformat{\section}[hang]
{\normalfont\bfseries\sffamily}
{}
{0em}
{%
	\makebox[\columnwidth]{%
		\colorbox{gray!20}{%
			\parbox{\columnwidth}{%
				\parbox[t]{\widestnum}{\thesection}%
				\parbox[t]{\dimexpr\columnwidth-\widestnum\relax}{\strut \uppercase{#1}\strut}%
			}%
		}%
	}%
}

\titleformat{\subsection}[hang]
{\normalfont\bfseries\sffamily}
{}
{0em}
{%
\uppercase{#1}
}
\titleformat{\subsubsection}[hang]
{\normalfont\bfseries\sffamily}
{}
{0em}
{%
	#1
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Figures
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% https://tex.stackexchange.com/questions/31545/rounded-corner-colored-box-around-figure
% box
\usepackage[framemethod=TikZ]{mdframed}
\mdfdefinestyle{myFigureBoxStyle}{roundcorner=3pt,tikzsetting={draw=black, line width=2pt},
	 innertopmargin=1pt,innerbottommargin=0pt,innerleftmargin=1pt,innerrightmargin=1pt,}%
\makeatletter
\newcommand\fs@myFigureStyle{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@plain
	\def\@fs@pre{\begin{mdframed}[style=myFigureBoxStyle]}%
		\def\@fs@mid{\vspace{\abovecaptionskip}}%
		\def\@fs@post{\end{mdframed}}\let\@fs@iftopcapt\iffalse}
\makeatother

\usepackage{float}
\floatstyle{myFigureStyle} 
\restylefloat{figure}

% caption
\usepackage{caption}
\DeclareCaptionFont{white}{\color{white}}
\DeclareCaptionFormat{figure}{
	\colorbox{DarkGray}{%%%%
		\noindent
		\parbox{\dimexpr\linewidth-2\fboxsep}{\hspace{0cm}#1#2#3}%
	}
}
\captionsetup{format=figure,
	labelfont=white,
	textfont=white,
	margin={-2pt,1pt},
	font={bf,small,sf}}
%\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}



%%%%%%%%%%%%%%%%%
% EPIGRAPHS
%%%%%%%%%%%%%%%%%
% Quote
\usepackage{epigraph}
\usepackage{lmodern}
%\usepackage{letltxmacro}
\usepackage{cuted}

%\newlength\longest

%\LetLtxMacro\oldepigraph\epigraph
%\renewcommand{\epigraph}[1]{ %
%\begin{minipage}[c]{\textwidth}
% \centering%
% \oldepigraph{dada #1}%
%\end{minipage}
%}

