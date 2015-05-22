\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icmc-tech-report}[2011/07/14 v2 ICMC Technical Report]

%
% Execution of options
\ProcessOptions\relax

%
% Package loading
%
\LoadClassWithOptions{book}

\RequirePackage{latexscholar-book}

\newcommand{\techreportname}{Technical Report}

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\institute#1{\gdef\@institute{#1}}%
\def\@institute{\@latex@error{No \noexpand\institute given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%

\def\date#1{\gdef\@date{#1}}%
\def\@date{\@latex@error{No \noexpand\date given}\@ehc}%

\def\trnumber#1{\gdef\@trnumber{#1}}%
\def\@trnumber{\@latex@error{No \noexpand\trnumber given}\@ehc}%

\def\issn#1{\gdef\@issn{#1}}%
\def\@issn{\@latex@error{No \noexpand\issn given}\@ehc}%

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
	{\LARGE \allcaps{\@university} \par}%
	{\Large \@institute \par}
	\vspace{9em}
	\rule{.8\linewidth}{.3mm}
	\vskip 1em
	\begin{minipage}{.7\linewidth}
		\centering
		{\Large \textsf{\@title} \par}
		\vskip 2em
		{\large \textbf{\textit{\@author}} \par}
		\vskip 1.5em
		{\large \textbf{n. \@trnumber} \par}
	\end{minipage}
	\vskip 1em
	\rule{.8\linewidth}{.3mm}
	\vfill
	{\Large \textbf{\allcaps{\techreportname}}}
	\vfill
	{\includegraphics[width=.12\textwidth]{\@logo} \par}
	\vfill
	{\large \textbf{\@address} \par}
	{\large \textbf{\@date} \par}
	\end{adjustwidth}


	\cleardoublepage
	\begin{adjustwidth}{-.5cm}{}
	\null
	\centering
	{\LARGE \allcaps{\@university} \par}
	{\Large \@institute \par}
	\begin{flushright}
		ISSN: \@issn
	\end{flushright}
	\vspace{8em}
	\rule{.8\linewidth}{.3mm}
	\vskip 1em
	\begin{minipage}{.7\linewidth}
		\centering
		{\Large \textsf{\@title} \par}
		\vskip 2em
		{\large \textbf{\textit{\@author}} \par}
		\vskip 1.5em
		{\large \textbf{n. \@trnumber} \par}
	\end{minipage}
	\vskip 1em
	\rule{.8\linewidth}{.3mm}
	\vfill
	{\Large \textbf{\allcaps{\techreportname}}}
	\vfill
	{\includegraphics[width=.12\textwidth]{\@logo} \par}
	\vfill
	{\large \textbf{\@address} \par}
	{\large \textbf{\@date} \par}
	\end{adjustwidth}
\end{titlepage}
\cleardoublepage
\pagestyle{plain}
}
