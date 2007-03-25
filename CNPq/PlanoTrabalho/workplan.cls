\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myarticle}[2006/06/21 Customized article]
\LoadClass[12pt,twoside,a4paper,onecolumn]{article}

% l10n
\RequirePackage[english,brazil]{babel}

% i18n
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ae}

% Parâmetros que determinam a qualidade e compressão utilizada para os documentos PDF
% \pdfcompresslevel=6
% \pdfpkresolution=600
% \pdfimageresolution=72
\pdfcompresslevel=9
\pdfpkresolution=1200
\pdfimageresolution=600

\newcommand{\metadata}{
	\pdfinfo {
		/Title (\@title)
		/Author (\@author)
		/Keywords (\@keywords)
	}
}

\RequirePackage[pdftex]{geometry}
\geometry{a4paper,left=2.5cm,right=2.5cm,top=3cm,bottom=3cm}

\RequirePackage{url}

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university{} given}\@ehc}%

\def\departament#1{\gdef\@departament{#1}}%
\def\@departament{\@latex@error{No \noexpand\departament{} given}\@ehc}%

\def\masterproject#1{\gdef\@masterproject{#1}}%
\def\@masterproject{\@latex@error{No \noexpand\masterproject{} given}\@ehc}%

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor{} given}\@ehc}%


\renewcommand{\maketitle}{%
\pagestyle{empty}
\begin{titlepage}
	\newpage
	\null
	\vfill
	\begin{minipage}{.9\linewidth}
		\begin{center}
			{\Large Plano de trabalho}
			\vskip 9.5em
			{\LARGE \textsf{\@title} \par}
			\vskip 10em
		\end{center}
	\end{minipage}
	\vfill
	\begin{flushright}
		{\large \textbf{Bolsista:}\textit{\@author} \normalsize \par}
		\vskip .5em
		{\large \textbf{Orientador:} \textit{\@advisor} \normalsize \par}
		\vskip 1.5em
	\end{flushright}
	\vfill
	\begin{center}
		\begin{large}\@date\end{large} \par
	\end{center}
	\cleardoublepage
\end{titlepage}
}
