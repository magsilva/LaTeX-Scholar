\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-monograph}[2007/03/23 Common monograph]

\LoadClass{common-book}

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\institute#1{\gdef\@institute{#1}}%
\def\@institute{\@latex@error{No \noexpand\institute given}\@ehc}%

\def\course#1{\gdef\@course{#1}}%
\def\@course{\@latex@error{No \noexpand\course given}\@ehc}%

\def\professor#1{\gdef\@professor{#1}}%
\def\@professor{\@latex@error{No \noexpand\professor given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%

\def\date#1{\gdef\@date{#1}}%
\def\@date{\@latex@error{No \noexpand\date given}\@ehc}%

\def\logo#1{\gdef\@logo{#1}}%
\def\@logo{\@latex@error{No \noexpand\logo (filename) given}\@ehc}%


% Folha de rosto e capa
\renewcommand{\maketitle}{%
\pagestyle{empty}
\begin{titlepage}
	\cleardoublepage
	\begin{adjustwidth}{-.5cm}{}
	\null
	\centering
	\vspace{3em}
	{\fontshape{ol}\selectfont \LARGE \allcaps{\@university} \par}
	{\Large \@institute \par}
	\vspace{10em}
	\rule{.8\linewidth}{.3mm}
	\vskip 1em
	\begin{minipage}{.7\linewidth}
		\centering
		{\Large \textsf{\@title} \par}
		\vskip 2em
		{\large \textbf{\textit{\@author}} \par}
	\end{minipage}
	\vskip 1em
	\rule{.8\linewidth}{.3mm} \par
	\vspace{6em}
	{\large \textbf{\allcaps{\@course}} \par}
	{\large \textbf{\@professor} \par}
	\vfill
	{\includegraphics[scale=.13]{\@logo} \par}
	{\large \textbf{\@address} \par}
	{\large \textbf{\@date} \par}
	\end{adjustwidth}
\end{titlepage}
}


% Macro para destacar as primeiras letras do texto. Um texto do tipo:
%
%  \begin{document}
%    \versal{IN} THE beginning God created the heaven and the earth.  Now the
%    earth was unformed and void, and darkness was upon the face of the
%    deep; and the spirit of God hovered over the face of the waters.
%  \end{document}
%
%  produzirá algo como:
%
%  I I\  I THE beginning God  created the heaven and  the earth.
%  I I \ I Now the earth was unformed and void, and darkness was
%  I I  \I upon the face of the deep; and the spirit of God hov-
%  ered over the face of the waters.
\font\versalfont= pzcmi scaled 6500
\newcommand{\versal}[1]{{\noindent
    \setbox0\hbox{\versalfont #1 }%
    \count0=\ht0                   % height of versal
    \count1=\baselineskip          % baselineskip
    \divide\count0 by \count1      % versal height/baselineskip
    \dimen1 = \count0\baselineskip % distance to drop versal
    \advance\count0 by 1\relax     % no of indented lines
    \dimen0=\wd0                   % width of versal
    \global\hangindent\dimen0      % set indentation distance
    \global\hangafter-\count0      % set no of indented lines
    \hskip-\dimen0\setbox0\hbox to\dimen0{\raise-\dimen1\box0\hss}%
    \dp0=0in\ht0=0in\box0}}


%%%%%%%%%%%%%%%%%%%%%%%%
% Title definitions
%
% The 'titlesec' package is fabulous! Changing the \chapter and friends is a nightmare. That
% package makes the job easy, piece of cake actually!
%
% noindentafter: Do not indent the first paragraph after a title definition
% rigidchapters: Set a fixed space for chapters
% nobottontitles*: Do not allow a title hanging at the botton (like a widow line)
% largestsep: Uses the largest space between two following titles.
% clearempty: Do not show the page number in an empty page (pretty common in doubleepage docs).
\RequirePackage[noindentafter,rigidchapters,nobottomtitles*,largestsep,clearempty]{titlesec}
% \RequirePackage[sf,sl,outermarks]{titlesec}

% Add a dot after the section/subsection/etc counters.
\titlelabel{\thetitle.\quad}

% titlespacing{<command>}{<left>}{<before>}{<after>}[<right>]
\titlespacing{\section}{0pt}{1.5em}{1em}[0pt]

% Pretty chapter start
\font\chapternumberfont= goxi2074 scaled 2000
\titleformat{\chapter}[display]
	{\normalfont\Large\sffamily}
	{
		\filright
		\rule[32pt]{.7\linewidth}{4pt}
		\hspace{-8pt}
		\shadowbox{
			\begin{minipage}{.18\linewidth}
				\centering
				\textsc{\Large\chaptertitlename}\\
				\vspace{1ex}
				{\chapternumberfont \thechapter}\\
				\vspace{1ex}
			\end{minipage}
		}
	}
	{0pt}
	{\filcenter\Huge}
	[\hfill\rule{.8\textwidth}{0.5pt}\\\vskip-1.8ex\hfill\rule{.7\textwidth}{3pt}]


% Pretty chapter start at frontmatter
\newpagestyle{frontmatter}{
	\sethead{}
		{}
		{\textsl{\chaptertitle}}
	\setfoot{}
		{\thepage}
		{}
}

% Pretty chapter start at mainmatter
\newpagestyle{mainmatter}[\small\sffamily]{
	\headrule
	\sethead[\textsl{\chaptername~\thechapter}][][\textsl{\chaptertitle}]{\textsl{\thesection~\sectiontitle}}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}

% Pretty chapter start at backmatter
\newpagestyle{backmatter}{
	\headrule
	\sethead{}
		{}
		{\textsl{\chaptertitle}}
	\setfoot{}
		{\thepage}
		{}
}


% Configura cabeçalho e rodapé das páginas do corpo do texto para
% conter, páginas pares, o nome da seção e, nas páginas impares, o nome
% do capítulo.
\renewcommand\frontmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{frontmatter}
	\pagenumbering{roman}
	\titlespacing{\chapter}{0pt}{2.5em}{10em}[0pt]
}

\renewcommand\mainmatter{
	\cleardoublepage
	\@mainmattertrue
	\pagestyle{mainmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{2.5em}{20em}[0pt]
	\acresetall{}
}

\renewcommand\backmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{backmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{2.5em}{10em}[0pt]
}