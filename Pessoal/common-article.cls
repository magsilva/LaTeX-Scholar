\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-article}[2007/03/23 Common packages and settings]

\DeclareOption{onecolumn}{
	\PassOptionsToClass{11pt,onecolumn}{article}
}

\DeclareOption{twocolumn}{
	\PassOptionsToClass{10pt,twocolumn}{article}
}

\RequirePackage{ifthen}
\newboolean{showlicense}
\setboolean{showlicense}{false}
\DeclareOption{license}{\setboolean{showlicense}{true}}
\DeclareOption{nolicense}{\setboolean{showlicense}{false}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{oneside,a4paper}
\ProcessOptions

\LoadClass{article}

\RequirePackage{common}

\setlength{\parskip}{3pt}

\def\email#1{\gdef\@email{#1}}%
\def\@email{\@latex@error{No \noexpand\email given}\@ehc}%


% Do no use uppercase for \bibname.
\renewenvironment{thebibliography}[1]{
	\section*{\mybibname}%
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

\newenvironment{resumo}{
	\setstretch{1}
	\narrower
	\begin{center}
		\textbf{Resumo}
		\vspace{-6pt}
	\end{center}
	\vspace{-3pt}
}{
}


\renewenvironment{abstract}{
	\setstretch{1}
	\narrower
	\begin{center}
		\textbf{Abstract}
		\vspace{-6pt}
	\end{center}
	\vspace{-3pt}
}{
}