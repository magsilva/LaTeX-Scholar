\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{monograph}[2003/08/19 ICMC Monograph]
\LoadClass[12pt,oneside,a4paper]{book}

\RequirePackage[brazil]{babel}
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{titlesec}
\RequirePackage{color}
\RequirePackage{colortbl}
\RequirePackage{textfit}
\RequirePackage{fancyhdr}
\RequirePackage{float}

% Macro para compilação condicional -- PDF ou DVI/PS.
\newif\ifpdf
  \ifx\pdfoutput\undefined
  \pdffalse
\else
  \pdfoutput=1
  \pdftrue
\fi

\RequirePackage{graphicx}

\ifpdf
	\RequirePackage[pdftex]{geometry}
\else
	\RequirePackage[dvips]{geometry}
\fi

\geometry{a4paper,left=2.5cm,right=2cm,top=2cm,bottom=3.5cm}

\RequirePackage{setspace}
\onehalfspace

\RequirePackage{textcomp}

\RequirePackage{times}

\setlength{\parindent}{1.3cm}

\RequirePackage{boxedminipage}
\RequirePackage{calc}

\RequirePackage{version}

\RequirePackage{chngpage}


\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\fulldate#1{\gdef\@fulldate{#1}}%
\def\@fulldate{\@latex@error{No \noexpand\fulldate given}\@ehc}%

\renewcommand{\maketitle}{%
\pagestyle{empty}
\begin{titlepage}
	\newpage
	\null
	\begin{adjustwidth}{-.5cm}{}
	\vfill
	\begin{center}
		\rule{.8\linewidth}{.3mm}
		\begin{minipage}{.7\linewidth}
			\begin{center}
				\vskip 1.5em
				{\Large \textsf{\@title} \par}
				\vskip 2em
				{\large \textbf{\textit{\@author}} \normalsize \par}
				\vskip 1.5em
			\end{center}
		\end{minipage}
		\rule{.8\linewidth}{.3mm}
	\end{center}
	\vfill
	\newpage
	\null
	\begin{flushright}
		\begin{boxedminipage}[t]{8cm}
			\begin{center}
				\begin{footnotesize}
				SERVIÇO DE PÓS-GRADUAÇÃO DO ICMC-USP \par
				\end{footnotesize}
			\end{center}
			\vskip .5em
			Data de Depósito: \@fulldate \par
			\vskip 1em
			Assinatura: \rule{.7\linewidth}{.05mm} \par
		\end{boxedminipage}
	\end{flushright}
	\begin{center}
		\vfill
		{\large \textbf{\@title} \par}
		\vskip 4em
		{\textbf{\textit{\@author}} \par}
		\vskip 3em
		{\textbf{Orientador: \textit{\@advisor}} \par}
	\end{center}
	\vfill
	\begin{flushright}
		\begin{minipage}{.7\linewidth}
			{\hyphenpenalty=10000 Monografia apresentada ao Instituto de Ciências Matemáticas e de Computação - USP, para o Exame de Qualificação, como parte dos requisitos para a obtenção do título de Mestre em Ciências de Computação e Matemática Computacional. \par}%
		\end{minipage}
	\end{flushright}
	\vfill
	\begin{center}
		USP - São Carlos \par
		\@date \par
	\end{center}
	\clearpage
	\end{adjustwidth}
\end{titlepage}
}

% Macro para zerar os parâmetros relacionados a espaçamento vertical.
% Originalmente este código pertencia ao FAQ francês sobre LaTeX.
\def\Nospacing{\itemsep=0pt\partopsep=0pt\parskip=0pt\parsep=0pt}

% Redifinição do ambiente description para diminuir o espaçamento entre os itens. Uma solução mais
% elegante seria aquela adotada para itemize e enumerate nesta mesmo classe, mas ela não funciona
% (talvez esteja relacionado ao fato do description ser redefinido em na classe book).
\renewenvironment{description}
	{\list{}{
		\Nospacing
		\let\makelabel\descriptionlabel}
	}
	{\endlist}

% Redefinição do rótulo de item em description, igual ao do book com exceção dos ":" adicionado no final.
\renewcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries #1:}

% Redefinição dos ambientes itemize e enumerate. Código retirado do FAQ francês sobre LaTeX.
\let\orig@Itemize =\itemize
\let\orig@Enumerate =\enumerate
\renewenvironment{itemize}{\orig@Itemize\Nospacing}{\endlist}%
\renewenvironment{enumerate}{\orig@Enumerate\Nospacing}{\endlist}%

% Cria o cabeçalho da página inicial do capítulo.
\titleformat{\chapter}[display]
    {\sffamily\Huge\hrulefill a}
    {\begin{tabular}{|c|}
        \rowcolor{black}\color{white} \large \scshape \chaptername \\
        \vspace{-2ex}\\ %coloquei para aumentar o espaço entre o título e o número
        \Huge \slshape \scaletoheight{1cm}{\thechapter} \\ \hline
    \end{tabular}
    }
    {8pt}
    {\Huge\bfseries\filleft}
    [\hfill\rule{.8\textwidth}{0.5pt}\\
    \vskip-2.4ex\hfill\rule{.8\textwidth}{2pt}\\
    \vskip 1.5ex]

% Comando para criar dedicatórias.
\newcommand{\dedicate}[1]{
	\pagebreak
	\par\ \\
	\vfill
	\hfill
	\parbox{.4\linewidth}{\textsl{#1}}
	\vspace{3cm}
}

% Ambientes para colocar o resumo (português e inglês). Observe que as margens
% desses ambientes é ligeiramente reduzida, dando uma aparência, hum, melhor.
\newenvironment{abstract}{
	\chapter*{Abstract}
	\addcontentsline{toc}{chapter}{Abstract}
	\narrower
	\vfill
}{
	\vfill
}
\newenvironment{resumo}{
	\chapter*{Resumo}
	\addcontentsline{toc}{chapter}{Resumo}
	\narrower
	\vfill
}{
	\vfill
}

% Adenilso e Auri 07-12-00
\renewcommand\mainmatter{
	\cleardoublepage
%	\raggedbottom
	\@mainmattertrue
	\pagenumbering{arabic}
%	\setlength\parskip{3pt plus 2pt minus 2pt}
%	\normalsize
	\pagestyle{fancy}
	\onehalfspace
}

% Avoid a left page with page numbering? 
\renewcommand\backmatter{%
	\if@openright
		\cleardoublepage}
	\else
		\clearpage
	\fi
}

% Simplified spacing ({-3.5ex \@plus -1ex \@minus -.2ex}, {2.3ex \@plus.2ex})
\renewcommand\section{
	\@startsection{section}
		{1}
		{\z@}
		{-3.5ex}
		{2.3ex}
		{\normalfont\Large\bfseries}
}

% Simplified spacing ({-3.25ex\@plus -1ex \@minus -.2ex}, {1.5ex \@plus .2ex})
\renewcommand\subsection{
	\@startsection{subsection}
		{2}
		{\z@}
		{-3.25ex}
		{1.5ex}
		{\normalfont\large\bfseries}
}

% Simplified spacing ({-3.25ex\@plus -1ex \@minus -.2ex}, {1.5ex \@plus .2ex})
\renewcommand\subsubsection{
	\@startsection{subsubsection}
		{3}
		{\z@}
		{-3.25ex}
		{1.5ex}
		{\normalfont\normalsize\bfseries}
}

\fancyhead{}
\fancyhead[RO,LE]{\thepage}
\fancyhead[RE]{\slshape \rightmark} % pagina par - seção
\fancyhead[LO]{\slshape \leftmark} % pagina impar - capítulo
\fancyfoot[C]{}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\setlength\headheight{3ex}
\setlength\headsep{2ex}

\floatplacement{table}{!htb}
\floatplacement{figure}{!htb}

% Proíbe linhas orfas e viuvas
\widowpenalty = 10000
\clubpenalty = 10000

\renewcommand{\chaptermark}[1]{
	\markboth{
		\chaptername
		{\thechapter\ ---\ #1}
	}{}
}

\renewcommand{\sectionmark}[1]{%
	\markright{\thesection\ #1}}

% Does not use uppercase the \bibname.
\newenvironment{thebibliography}[1]{
	\chapter*{\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


% Remove title's footnote mark from TOC.
\RequirePackage[stable]{footmisc}

% Adds that fancy PDF's table of contents (bookmark entries).
\RequirePackage{hyperref}

\RequirePackage[bf,hang]{caption} %nooneline - tirei do colchetes para centralizar o indice de figuras Tatiana 10/01/02
\RequirePackage[sf,bf]{titlesec}
