\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dtireport}[2006/09/14 CNPQ-ITI Report]
\LoadClass[12pt,twoside,a4paper]{article}

\RequirePackage[english,brazil]{babel}
\RequirePackage[latin1]{inputenc}

\RequirePackage{url}

% Definição do posicionamento padrão das tabelas e figuras
\RequirePackage{float}
\restylefloat{table}
\restylefloat{figure}
\floatplacement{table}{!htb}
\floatplacement{figure}{!htb}

% Otimização no espaço ocupado por floats
\renewcommand{\floatsep}{8pt}
\renewcommand{\intextsep}{12pt}
\renewcommand{\textfloatsep}{12pt}

% Diminui o espaço entre um float e seu caption.
\setlength{\abovecaptionskip}{4pt}

% Pacote para coordenar o posionamento de floats.
% Utilize \afterpage{\clearpage} para forçar que todos os floats definidos até
% aquele momento sejam inseridos.
\RequirePackage{afterpage}

% Habilitar a utilização de figuras
\RequirePackage[pdftex]{graphicx}
\RequirePackage{epstopdf}

% Alteração das margens das páginas
\RequirePackage[pdftex]{geometry}
\geometry{a4paper,left=2.5cm,right=2cm,top=2cm,bottom=3.5cm}

% Configuração do espaçamento entre linhas (1,5)
\RequirePackage{setspace}
\onehalfspace

% Configuração da indentação do parágrafo
\setlength{\parindent}{1.3cm}

% Lista de acrônimos
\RequirePackage[printonlyused]{acronym}

% Macro utilizada para termos em inglês.
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}

% Macro utilizada para trechos de código-fonte inseridos no meio do texto.
\newcommand\srccode[1]{\foreignlanguage{english}{\texttt{\small{#1}}}}

% Utilizado para listagens de código-fonte
\RequirePackage{listings}
\lstset{basicstyle=\tiny}
\lstset{tabsize=4}
\lstset{frame=single}
\lstset{aboveskip=.5cm}
\lstset{belowskip=.5cm}
\lstset{xleftmargin=1cm}
\lstset{xrightmargin=1cm}
\lstset{resetmargins=true}
\lstset{frame=single}

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

% Redefinição do rótulo de item em description, igual ao do book
\renewcommand*\descriptionlabel[1]{
	\hspace
	\labelsep
	\normalfont
	\bfseries #1
}

% Redefinição dos ambientes itemize e enumerate, corrigindo o espaçamento entre
% os itens. Código retirado do FAQ francês sobre LaTeX.
\let\orig@Itemize =\itemize
\let\orig@Enumerate =\enumerate
\renewenvironment{itemize}{\orig@Itemize\Nospacing}{\endlist}
\renewenvironment{enumerate}{\orig@Enumerate\Nospacing}{\endlist}



% Traduz os nomes de listagens e fragmentos de código para português
\renewcommand{\lstlistingname}{Fragmento de código}
\renewcommand{\lstlistlistingname}{Lista de fragmentos de código}

% Adequação das citações e referências a norma ABNT
\RequirePackage[alf,abnt-url-package=url]{abntcite}

\RequirePackage[nottoc,notindex,notlot,notlof,numbib]{tocbibind}

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university{} given}\@ehc}%

\def\departament#1{\gdef\@departament{#1}}%
\def\@departament{\@latex@error{No \noexpand\departament{} given}\@ehc}%

\def\masterproject#1{\gdef\@masterproject{#1}}%
\def\@masterproject{\@latex@error{No \noexpand\masterproject{} given}\@ehc}%

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor{} given}\@ehc}%

\def\processid#1{\gdef\@processid{#1}}%
\def\@processid{\@latex@error{No \noexpand\processid{} given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address{} given}\@ehc}%


\renewcommand{\maketitle}{%
	\pagestyle{empty}
	\begin{titlepage}
		\newpage
		\null
		\vfill
		\begin{minipage}{.9\linewidth}
			\begin{center}
				{\Large \textbf{Projeto} \par}
				\vskip 1em
				{\Large \textsf{\@masterproject} \par}
				\vskip 1em
				{\large Processo nº \@processid}
			\end{center}
			\vskip 7em
			\begin{center}
				{\Large \textbf{Relatório Parcial} \par}
				\vskip 1em
				{\LARGE \textsf{\@title} \par}
			\end{center}
		\end{minipage}
		\vfill
		\begin{flushleft}
			{\large \textbf{Bolsista:}\textit{\@author} \normalsize \par}
			\vskip 1em
			{\large \textbf{Coordenador:} \textit{\@advisor} \normalsize \par}
			\vskip 1.5em
		\end{flushleft}
		\vfill
		\begin{center}
			{\large \@address \par}
			{\large \@date \par}
		\end{center}
	\end{titlepage}
	\cleardoublepage
}
