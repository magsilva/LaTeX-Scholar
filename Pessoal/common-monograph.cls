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