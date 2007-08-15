\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{summary}[2006/06/21 Customized text summary]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{common-article}}
\ProcessOptions

\LoadClass[abnt-num]{common-article}

\def\titleref#1{\gdef\@titleref{#1}}%
\def\@titlerefl{\@latex@error{No \noexpand\titleref given}\@ehc}%


\AtBeginDocument{
	\maketitle
}

\AtEndDocument{
	\bibliographystyle{abnt-alf}
	\bibliography{root}
}


% Do no use uppercase for \bibname.
\renewenvironment{thebibliography}[1]{
	\list{
		\@biblabel{\@arabic\c@enumiv}
	}{
		\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}
	}
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m
}{
	\def\@noitemerr
	{\@latex@warning{Empty thebibliography environment}}
	\endlist
}


\def\@maketitle{
	\null
	\begin{center}
		{\large Resumo do trabalho \par}
		{\LARGE \@title \cite{\@titleref}\par}
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