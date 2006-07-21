\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{relatorio-bolsa}[2004/01/29 Relatório para bolsa CAPES ou CNPq]
\LoadClass[12pt,a4paper]{article}

\RequirePackage[brazil]{babel}
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{setspace}
\RequirePackage[brazil]{varioref}
\RequirePackage{indentfirst}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\geometry{a4paper,left=2cm,right=2cm,top=2cm,bottom=2cm}
\RequirePackage{longtable}
\RequirePackage{hyperref}
\RequirePackage{url}

\RequirePackage{lscape}

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{\@latex@error{No \noexpand\subtitle given}\@ehc}

\def\grant#1{\gdef\@grant{#1}}
\def\@subtitle{\@latex@error{No \noexpand\grant given}\@ehc}

\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}

\def\begindate#1{\gdef\@begindate{#1}}
\def\@begindate{\@latex@error{No \noexpand\begindate given}\@ehc}

\def\grantbegindate#1{\gdef\@grantbegindate{#1}}
\def\@grantbegindate{\@latex@error{No \noexpand\grantbegindate given}\@ehc}

\def\@maketitle{%
	\newpage
	\thispagestyle{empty}
	\null
	\begin{center}
		{\LARGE Relatório de Atividades}
		\vskip 1em
    		{\large Relativo ao \@subtitle{}}
		\vfill
    		{\large Mestrando: \@author{}}
		\vskip 1em
		{\large Orientadora: \@advisor{}}
		\vskip 6em
		{\LARGE \@title{}}
		\vskip 8em
		{Data de ingresso no curso: \@begindate{}}
		\vskip 1em
		{Data de início da bolsa: \@grantbegindate{}}
		\vskip 1em
		{\large Bolsista \@grant{}}
    		\vfill
    		{\large \today{}}
  	\end{center}
	\newpage%
	\setcounter{page}{1}%
}
