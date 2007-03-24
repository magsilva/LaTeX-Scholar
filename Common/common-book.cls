\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-book}[2007/03/23 Customized book]

\LoadClass[12pt,twoside,a4paper]{book}
\RequirePackage{common}

\RequirePackage{chngpage}

% Do no use uppercase for \bibname.
\renewenvironment{thebibliography}[1]{
	\chapter*{\bibname}%
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

