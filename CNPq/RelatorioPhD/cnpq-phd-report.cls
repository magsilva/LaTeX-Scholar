\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cnpq-php-report}[2007/11/07 CNPQ Report (PhD version)]
\LoadClass{common-book}


\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university{} given}\@ehc}%

\def\departament#1{\gdef\@departament{#1}}%
\def\@departament{\@latex@error{No \noexpand\departament{} given}\@ehc}%

\def\masterprocessid#1{\gdef\@masterprocessid{#1}}%
\def\@masterprocessid{\@latex@error{No \noexpand\masterprocessid{} given}\@ehc}%

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor{} given}\@ehc}%

\def\processid#1{\gdef\@processid{#1}}%
\def\@processid{\@latex@error{No \noexpand\processid{} given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address{} given}\@ehc}%

\def\graduationprogram#1{\gdef\@graduationprogram{#1}}%
\def\@graduationprogram{\@latex@error{No \noexpand\graduationprogram given}\@ehc}%

\def\degree#1{\gdef\@degree{#1}}%
\def\@degree{\@latex@error{No \noexpand\degree given}\@ehc}%

\def\cnae#1{\gdef\@cnae{#1}}%
\def\@cnae{\@latex@error{No \noexpand\cnae given}\@ehc}%

\def\knowledgearea#1{\gdef\@knowledgearea{#1}}%
\def\@knowledgearea{\@latex@error{No \noexpand\knowledgearea given}\@ehc}%




\renewcommand{\maketitle}{%
	\thispagestyle{empty}
	\null
	\vfill
	\begin{minipage}{.9\linewidth}
		\begin{center}
			{\Large \textbf{Projeto} \par}
			\vskip 1em
			{\Large \textsf{\@title} \par}
			\vskip 1em
			{\large Processo-mãe \@masterprocessid}
		\end{center}
		\vskip 7em
		\begin{center}
			{\Large \textbf{Relatório parcial} \par}
			\vskip 1em
			{\large Processo \@processid}
		\end{center}
	\end{minipage}
	\vfill
	\begin{flushleft}
		{\large \textbf{Bolsista:} \textit{\@author} \normalsize \par}
		\vskip 1em
		{\large \textbf{Orientador:} \textit{\@advisor} \normalsize \par}
		\vskip 1.5em
	\end{flushleft}
	\vfill
	\begin{center}
		{\large \@address \par}
		{\large \@date \par}
	\end{center}
	{\pagestyle{empty}\cleardoublepage}
}
