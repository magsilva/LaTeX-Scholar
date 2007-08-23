\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{summary}[2006/06/21 Customized text summary]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{common-article}}
\ProcessOptions

\PassOptionsToPackage{num}{abntcite}
\LoadClass{common-article}

\def\titleref#1{\gdef\@titleref{#1}}%
\def\@titlerefl{\@latex@error{No \noexpand\titleref given}\@ehc}%

\newcommand{\datename}{Date}
\iflanguage{brazil}{\renewcommand{\datename}{Data}}{}

\AtBeginDocument{
	\maketitle
	% Something after the \maketitle is setting the pagestyle.
	\thispagestyle{empty}
}

\AtEndDocument{
	\small
	\singlespacing
	\nocite{\@titleref}
	\bibliographystyle{abnt-alf}
	\bibliography{root}
}

\geometry{a4paper,left=2cm,right=2cm,top=2cm,bottom=2cm}
\pagestyle{empty}

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
	{\noindent \large Resumo do artigo: \textbf{\@title} \par}
	\noindent \@author \hspace{.3em} <\@email> \\\datename: \getdateday{copyrightdate}/\getdatemonth{copyrightdate}/\getdateyear{copyrightdate}
	\vskip 1em
	\printlicense
}