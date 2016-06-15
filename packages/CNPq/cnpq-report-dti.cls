\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtireport}[2007/11/07 CNPQ-ITI Report]

\RequirePackage{latexscholar-book}


\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university{} given}\@ehc}%

\def\departament#1{\gdef\@departament{#1}}%
\def\@departament{\@latex@error{No \noexpand\departament{} given}\@ehc}%

\def\masterproject#1{\gdef\@masterproject{#1}}%
\def\@masterproject{\@latex@error{No \noexpand\masterproject{} given}\@ehc}%

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor{} given}\@ehc}%

\def\processid#1{\gdef\@processid{#1}}%
\def\@processid{\@latex@error{No \noexpand\processid{} given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address{} given}\@ehc}%


\renewcommand{\maketitle}{%
	\thispagestyle{empty}
	\null
	\vfill
	\begin{minipage}{.9\linewidth}
		\begin{center}
			{\Large \textbf{Projeto} \par}
			\vskip 1em
			{\Large \textsf{\@masterproject} \par}
			\vskip 1em
			{\large Processo nº \@processid}
		\end{center}
		\vskip 7em
		\begin{center}
			{\Large \textbf{Relatório} \par}
			\vskip 1em
			{\LARGE \textsf{\@title} \par}
		\end{center}
	\end{minipage}
	\vfill
	\begin{flushleft}
		{\large \textbf{Bolsista:} \textit{\@author} \normalsize \par}
		\vskip 1em
		{\large \textbf{Coordenador:} \textit{\@advisor} \normalsize \par}
		\vskip 1.5em
	\end{flushleft}
	\vfill
	\begin{center}
		{\large \@address \par}
		{\large \@date \par}
	\end{center}
	{\pagestyle{empty}\cleardoublepage}
}
