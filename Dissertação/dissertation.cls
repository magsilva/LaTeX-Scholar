\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{monograph}[2003/08/19 ICMC Monograph]
\LoadClass[12pt,oneside,a4paper]{book}

\RequirePackage[brazil]{babel}
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}

% Definição do posicionamento padrão das tabelas e figuras
\RequirePackage{float}
\floatplacement{table}{!htb}
\floatplacement{figure}{!htb}

% Adequação das citações e referências a norma ABNT
\RequirePackage{abnt-alf}

% Macro para compilação condicional -- PDF ou DVI/PS.
\newif\ifpdf
  \ifx\pdfoutput\undefined
  \pdffalse
\else
  \pdfoutput=1
  \pdftrue
\fi



% Habilitar a utilização de figuras e alteracão das margens
\ifpdf
	\RequirePackage[pdftex]{graphicx}
	\RequirePackage[pdftex]{geometry}
\else
	\RequirePackage[pdftex]{graphicx}
	\RequirePackage[dvips]{geometry}
\fi

% A lteração das margens
\geometry{a4paper,left=2.5cm,right=2cm,top=2cm,bottom=3.5cm}

% Configuração espaçamento (1,5)
\RequirePackage{setspace}
\onehalfspace


% configuração da indentação do parágrafo
\setlength{\parindent}{1.3cm}

\RequirePackage{titlesec}
\RequirePackage{color}
\RequirePackage{colortbl}
\RequirePackage{textfit}
\RequirePackage{fancyhdr}
\RequirePackage{textcomp}
\RequirePackage{times}
\RequirePackage{boxedminipage}
\RequirePackage{calc}
\RequirePackage{version}

% Pacote necessário para fazer a folha de rosto e a capa (alterar as margens para
% centralizar o texto).
\RequirePackage{chngpage}

% Variáveis utilizadas para criar a capa da dissertação
% - advisor: Nome completo do(a) orientador(a)
% - fulldate: Data por extenso da entrega da dissertação
% - dedication: Dedicatória
\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\fulldate#1{\gdef\@fulldate{#1}}%
\def\@fulldate{\@latex@error{No \noexpand\fulldate given}\@ehc}%

\def\dedication#1{\gdef\@dedication{#1}}%
\def\@dedication{\@latex@warning{No \noexpand\dedication given}\@ehc}%

% Folha de rosto e capa
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
			{\hyphenpenalty=10000 Dissertação apresentada ao Instituto de Ciências Matemáticas e de Computação - ICMC-USP, como parte dos requisitos para a obtenção do título de Mestre em Ciências de Computação e Matemática Computacional. \par}%
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
\def\Nospacing{
	\itemsep=0pt
	\partopsep=0pt
	\parskip=0pt
	\parsep=0pt
}

% Redifinição do ambiente description para diminuir o espaçamento entre os itens. Uma solução mais
% elegante seria aquela adotada para itemize e enumerate nesta mesmo classe, mas ela não funciona
% (talvez esteja relacionado ao fato do description ser redefinido na classe book).
\renewenvironment{description}
	{\list{}{
		\Nospacing
		\let\makelabel\descriptionlabel}
	}
	{\endlist}

% Redefinição do rótulo de item em description, igual ao do book com exceção
% dos ":" agoraadicionado no final do rótulo.
\renewcommand*\descriptionlabel[1]{
	\hspace
	\labelsep
	\normalfont
	\bfseries #1:
}

% Redefinição dos ambientes itemize e enumerate, corrigindo o espaçamento entre
% os itens. Código retirado do FAQ francês sobre LaTeX.
\let\orig@Itemize =\itemize
\let\orig@Enumerate =\enumerate
\renewenvironment{itemize}{\orig@Itemize\Nospacing}{\endlist}
\renewenvironment{enumerate}{\orig@Enumerate\Nospacing}{\endlist}

% Cria o cabeçalho da página inicial do capítulo.
\titleformat{\chapter}[display]
	{
		\sffamily\Huge
%		\hrulefill a
	}
	{
		\begin{tabular}{|c|}
			\rowcolor{black}
			\color{white}
			\large
			\scshape
			\chaptername \\
			\vspace{-2ex} \\
			\Huge
			\slshape
			\scaletoheight{1cm}{\thechapter} \\ \hline
		\end{tabular}
	}
	{8pt}
	{\Huge\bfseries\filleft}
 	[\hfill\rule{.8\textwidth}{0.5pt}\\
 	\vskip-2.4ex\hfill\rule{.8\textwidth}{2pt}\\
 	\vskip 1.5ex]

% Comando para criar a dedicatória
\newcommand{\dedicate}{
	\cleardoublepage
	\vfill
	\hfill
	\parbox{.4\linewidth}{\textsl{\@dedication}}
	\vspace{3cm}
}

% Ambientes para colocar o resumo (português e inglês). Observe que as margens
% desses ambientes são ligeiramente reduzidas, dando uma aparência, hum, melhor.
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

% Configura cabeçalho e rodapé das páginas do corpo do texto para
% conter, páginas pares, o nome da seção e, nas páginas impares, o nome
% do capítulo.
\renewcommand\mainmatter{
	\cleardoublepage
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{fancy}
}

\fancyhead{}
\fancyhead[RO,LE]{\thepage}
\fancyhead[RE]{\slshape \rightmark} % pagina par - seção
\fancyhead[LO]{\slshape \leftmark} % pagina impar - capítulo

% "Proíbe" linhas orfas e viuvas
\widowpenalty = 10000
\clubpenalty = 10000

\renewcommand{\chaptermark}[1]{
	\markboth{
		\chaptername
		{\thechapter\ ---\ #1}
	}{}
}

\renewcommand{\sectionmark}[1]{
	\markright{\thesection\ #1}
}

% Does not use uppercase the \bibname.
\renewenvironment{thebibliography}[1]{
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

% Fonte sem serifa e em negrito para definição de títulos de seções
% \RequirePackage[sf,bf]{titlesec}