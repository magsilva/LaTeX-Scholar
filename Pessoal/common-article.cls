\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-article}[2007/03/23 Common packages and settings]

\RequirePackage{ifthen}
\newboolean{speciallicense}
\setboolean{speciallicense}{false}

\DeclareOption{onecolumn}{
	\PassOptionsToClass{11pt,onecolumn}{article}
}

\DeclareOption{twocolumn}{
	\PassOptionsToClass{10pt,twocolumn}{article}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{oneside,a4paper}
\ProcessOptions

\LoadClass{article}

\RequirePackage{common}

\setlength{\parskip}{3pt}

\def\email#1{\gdef\@email{#1}}%
\def\@email{\@latex@error{No \noexpand\email given}\@ehc}%

\def\license#1{\gdef\@license{#1}}%
\def\@license{\@latex@error{No \noexpand\license given}\@ehc}%

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


\newcommand{\printlicense}{
	\ifthenelse{\boolean{speciallicense}}{
		\let\origfootnote=\thefootnote
		\def\thefootnote{\relax}
		\footnotetext{\hspace{-1.8em}Copyright \copyright\  \number\year \  \@author. Este trabalho é disponibilizado de acordo com os termos da licença \@license.}
		\def\thefootnote{\origfootnote}
	}{
		\footnotetext{\hspace{-1.8em}Copyright \copyright\  \number\year \  \@author.}
	}
}



\def\@maketitle{
	\newpage
	\null
	\vskip 2em
	\begin{center}
		\let \footnote \thanks
		{\LARGE \@title \par}
		\vskip 1.5em
		{
			\large
			\lineskip .5em
			\begin{tabular}[t]{c}
				\@author \\ \@email
			\end{tabular}
			\par
		}
	\end{center}
	\par
	\vskip 1.5em
	\printlicense
}

