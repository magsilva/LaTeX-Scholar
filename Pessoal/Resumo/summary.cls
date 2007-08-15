\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{summary}[2006/06/21 Customized text summary]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{common-article}}
\ProcessOptions

\LoadClass{common-article}
\RequirePackage{footbib}

\def\titleref#1{\gdef\@titleref{#1}}%
\def\@titlerefl{\@latex@error{No \noexpand\titleref given}\@ehc}%

\AtBeginDocument{
	\maketitle
}

\AtEndDocument{
	\footbibliography{root}
	\footbibliographystyle{plain}
}

\def\@maketitle{
	\null
	\begin{center}
		{\large Resumo do trabalho \par}
		{\LARGE \@title \footcite{\@titleref}\par}
		\vskip 1.5em
		{
			\large
			\begin{tabular}[t]{c}
				\@author \hspace{.3em} <\@email> \\
				\today
			\end{tabular}
		}
	\end{center}
	\par
	\vskip 1.5em
	\printlicense
}