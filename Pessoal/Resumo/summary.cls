\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{summary}[2006/06/21 Customized text summary]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{common-article}}
\ProcessOptions

\PassOptionsToPackage{num}{abntcite}
\LoadClass{common-article}

\def\titleref#1{\gdef\@titleref{#1}}%
\def\@titlerefl{\@latex@error{No \noexpand\titleref given}\@ehc}%

\AtBeginDocument{
	\maketitle
}

\AtEndDocument{
	\small
	\singlespacing
	\bibliographystyle{abnt-alf}
	\bibliography{root}
}


\renewenvironment{thebibliography}[1]{
	\vspace{.5em}
	\footnoterule
	\vspace{-.8em}
	\list{
	}{
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
	{\noindent \large Resumo do artigo: \textbf{\@title} {\scriptsize \cite{\@titleref} \par}}
	\noindent \@author \hspace{.3em} <\@email> \\\today
	\vskip 1em
	\printlicense
}