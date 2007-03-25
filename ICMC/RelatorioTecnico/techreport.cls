\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}[2006/07/05 ICMC Technical Report]
\LoadClass{common-book}


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

\newcommand{\techreportname}{Relat�rios t�cnicos}


% Folha de rosto e capa
\renewcommand{\maketitle}{%
\pagestyle{empty}
\begin{titlepage}
	\cleardoublepage
	\begin{adjustwidth}{-.5cm}{}
	\null
	\centering
	\vspace{4em}
	{\LARGE \allcaps{\@university} \par} % TODO: fonte outline com sombra
	{\Large \@institute \par}
	\vspace{11em}
	\rule{.8\linewidth}{.3mm}
	\vskip 1em
	\begin{minipage}{.7\linewidth}
		\centering
		{\Large \textsf{\@title} \par}
		\vskip 2em
		{\large \textbf{\textit{\@author}} \par}
		\vskip 1.5em
		{\large \textbf{n� \@trnumber} \par}
	\end{minipage}
	\vskip 1em
	\rule{.8\linewidth}{.3mm}
	\par \vspace{6em}
	{\Large \textbf{\allcaps{\techreportname}}}
	\vfill
	\includegraphics[scale=.15]{\@logo}
	\vfill
	{\large \textbf{\@address} \par}
	\end{adjustwidth}


	\cleardoublepage
	\begin{adjustwidth}{-.5cm}{}
	\null
	\centering
	\vspace{4em}
	{\LARGE \allcaps{\@university} \par} % TODO: fonte outline com sombra
	{\Large \@institute \par}
	\begin{flushright}
		ISSN: \@issn
	\end{flushright}
	\vspace{10em}
	\rule{.8\linewidth}{.3mm}
	\vskip 1em
	\begin{minipage}{.7\linewidth}
		\centering
		{\Large \textsf{\@title} \par}
		\vskip 2em
		{\large \textbf{\textit{\@author}} \par}
		\vskip 1.5em
		{\large \textbf{n� \@trnumber} \par}
	\end{minipage}
	\vskip 1em
	\rule{.8\linewidth}{.3mm}
	\par \vspace{5em}
	{\Large \textbf{\allcaps{\techreportname}}}
	\vfill
	\includegraphics[scale=.15]{\@logo}
	\vfill
	{\large \textbf{\@address} \par}
	{\large \textbf{\@date} \par}
	\end{adjustwidth}
\end{titlepage}
\cleardoublepage
\pagestyle{plain}
}