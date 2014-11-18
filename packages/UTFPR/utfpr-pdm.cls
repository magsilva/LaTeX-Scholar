\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utfpr-pdm}[2014/11/17 PDM]

\LoadClassWithOptions{book}
\RequirePackage{latexscholar-book}

\RequirePackage{fancyhdr}

\RequirePackage{tocvsec2}
\maxtocdepth{subsubsection}

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\universityunit#1{\gdef\@universityunit{#1}}%
\def\@universityunit{\@latex@error{No \noexpand\universityunit given}\@ehc}%

\def\program#1{\gdef\@program{#1}}%
\def\@program{\@latex@error{No \noexpand\program given}\@ehc}%

\def\depositshortdate#1{\gdef\@depositshortdate{#1}}%
\def\@depositshortdate{\@latex@error{No \noexpand\depositshortdate given}\@ehc}%

\def\dissertationgoal#1{\gdef\@dissertationgoal{#1}}%
\def\@dissertationgoal{\@latex@error{No \noexpand\dissertationgoal given}\@ehc}%

\newcommand{\coverpageone}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\begin{center}
			\null
			\allcaps{\@university}
			\par
			\allcaps{\@universityunit}
			\par
			\allcaps{\@program}
			\par
			\vfill
			{\allcaps{\@author} \normalsize \par}
			\vfill
			{\large\textbf{\textsf{\allcaps{\@title}}} \par}
			\vfill
			{
				\allcaps{Proposta de Dissertação de Mestrado (PDM)} \par
				\allcaps{Orientador:} \allcaps{\@advisor} \par
			}
			\vfill
			\vspace{2.5cm}
			{\bf\allcaps{\@address} \par}
			{\bf\allcaps{\@depositshortdate} \par}
		\end{center}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
}


\newcommand{\coverpagetwo}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\vspace{2.6cm}
		\begin{center}
			{\allcaps{\@author} \par}
			\vfill
			{\large{\textbf{\textsf{\allcaps{\@title}}}} \par}
			\vspace{2.4cm}
			\begin{flushright}
				\begin{minipage}{8.5cm}
					{\hyphenpenalty=10000 \singlespacing \@dissertationgoal \par}%
					\vspace{.3cm}
					{\advisorname: \@advisor \par}
				\end{minipage}
			\end{flushright}		
			\vspace{2.5cm}
			{\bf\allcaps{\@address} \par}
			{\bf\allcaps{\@depositshortdate} \par}
		\end{center}
	\end{adjustwidth}
}

% Title and cover page
%
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\coverpageone
		\coverpagetwo
	\end{titlepage}
}
