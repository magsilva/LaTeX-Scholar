\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cnpq-php-report}[2007/11/07 CNPQ Report (PhD version)]
\LoadClass{latexscholar-article}

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

\def\tender#1{\gdef\@tender{#1}}%
\def\@tender{\@latex@error{No \noexpand\tender given}\@ehc}%

\def\term#1{\gdef\@term{#1}}%
\def\@term{\@latex@error{No \noexpand\term given}\@ehc}%

\def\grantterm#1{\gdef\@grantterm{#1}}%
\def\@grantterm{\@latex@error{No \noexpand\grantterm given}\@ehc}%


\def\reporttype#1{\gdef\@reporttype{#1}}%
\def\@reporttype{\@latex@error{No \noexpand\reporttype given}\@ehc}%

\renewcommand{\maketitle}{%
	\thispagestyle{empty}
	\begin{center}
		{\Large \textbf{\projecttypename}\\}
		{\large \@tender \par}
	\end{center}
	\vfill
	\begin{center}
		{\Large \textsf{\@title} \par}
		\vskip 2em
		{\Large \textbf{\@reporttype}\\}
		\vskip 1em
		{\large \projecttermname: \@term}
	\end{center}
	\vfill
	\begin{flushleft}
		\textbf{\projectscholarname:} \textit{\@author} \normalsize (Processo \@processid)\\
		\textbf{Modalidade da bolsa:} \@degree\\
		\textbf{\projectadvisorname:} \textit{\@advisor} \normalsize (Processo \@masterprocessid)
	\end{flushleft}
	\vfill
	\begin{center}
		{\large \@address \par}
		{\large \@date \par}
	\end{center}
	{\pagestyle{empty}\cleardoublepage}

	{\pagestyle{empty}\cleardoublepage}
}
