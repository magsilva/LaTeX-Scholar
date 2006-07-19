\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myarticle}[2006/06/21 Customized article]
\LoadClass[10pt,oneside,a4paper,twocolumn]{article}

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

\RequirePackage{titlesec}
\RequirePackage{color}
\RequirePackage{colortbl}
\RequirePackage{textfit}
\RequirePackage{textcomp}
\RequirePackage{boxedminipage}
\RequirePackage{calc}
\RequirePackage{version}

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

\RequirePackage{url}

% Alteração das margens das páginas
\RequirePackage[pdftex]{geometry}
\geometry{a4paper,left=2.5cm,right=2cm,top=2cm,bottom=3.5cm}

% Configuração do espaçamento entre linhas (1,5)
\RequirePackage{setspace}
\onehalfspace


% Lista de acrônimos
\RequirePackage[printonlyused]{acronym}

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
\renewenvironment{description}{
	\list{}{
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

% Redefiniçao do ambiente utilizado pela lista de acrônimos, corrigindo o espaçamento
% entre os itens.
\renewenvironment{AC@deflist}[1]{
	\raggedright
	\begin{list}{}{
		\Nospacing
		\settowidth{\labelwidth}{\textbf{\textsf{#1}}}
		\setlength{\leftmargin}{\labelwidth}
		\addtolength{\leftmargin}{\labelsep}
		\renewcommand{\makelabel}{\bflabel}
	}
}{
	\end{list}
}


% Does not use uppercase the \bibname.
\renewenvironment{thebibliography}[1]{
	\section*{\bibname}%
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


% Corretly format the footnotes
% stable: Remove title's footnote mark from TOC. 
% multiple: Adds a command between multiple sequencial footnote marks 
% marginal,flushmarginal: Keeps the footnotes within the margin and without indentation
% bottom: Footnotes will be inserted always at the page's bottom.
\RequirePackage[bottom,marginal,flushmargin,stable,multiple]{footmisc}

% Keep the footnote mark within the text area.
% http://tug.org/TeXnik/mainFAQ.cgi?file=footnotes/footnotes
\newlength{\myFootnoteWidth}
\newlength{\myFootnoteLabel}
\setlength{\myFootnoteLabel}{.8em}%  <-- can be changed to any valid value
\renewcommand{\@makefntext}[1]{%
  \setlength{\myFootnoteWidth}{\columnwidth}%
  \addtolength{\myFootnoteWidth}{-\myFootnoteLabel}%
  \noindent\makebox[\myFootnoteLabel][r]{\@makefnmark\ }%
  \parbox[t]{\myFootnoteWidth}{#1}%
}

\RequirePackage[bf,hang]{caption}

% Cores
\RequirePackage[cmyk,table]{xcolor}

% Impede a hifenização do conteúdo definido na macro \srccode.
\RequirePackage{hyphenat}

% Macro utilizada para termos em inglês.
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}

% Macro utilizada para trechos de código-fonte inseridos no meio do texto.
\newcommand\srccode[1]{\foreignlanguage{english}{\textnhtt{\small{#1}}}}

% Utilizado para listagens de código-fonte
\RequirePackage{listings}

% Traduz os nomes de listagens e fragmentos de código para português
\renewcommand{\lstlistingname}{Exemplo}
\renewcommand{\lstlistlistingname}{Lista de exemplos}

% Define os estilos a serem utilizados nos ambientes lstlistings.
\lstset{basicstyle=\scriptsize}
\lstset{tabsize=4}
\lstset{frame=single}
\lstset{frameround=tttt}
\lstset{aboveskip=.5cm}
\lstset{belowskip=.5cm}
\lstset{xleftmargin=.3cm}
\lstset{xrightmargin=.3cm}
\lstset{resetmargins=true}
\lstset{float}

% Resolve um warning do latex.
\setlength{\headheight}{16pt}

% Ambiente para citações diretas.
\renewenvironment{quotation}{
	\vspace{.5cm}
	\begin{flushright}
		\begin{minipage}{\linewidth - 4cm}
		\singlespacing
		\small
}{
		\end{minipage}
	\end{flushright}
	\vspace{.5cm}
}

% Ambiente para definições importantes (termos chaves).
\RequirePackage{fancybox}
\renewcommand{\fboxsep}{8pt}
\newcommand{\definition}[1]{
	\begin{center}
		\vspace{.5cm}
		\ovalbox{\parbox{\linewidth - 2.5cm}{#1}}
		\vspace{.5cm}
	\end{center}
}

	
\RequirePackage{enumerate}

% Altera a numeração do enumerate para 1.1, 1.2.1, etc (sempre números arábicos).
\renewcommand{\labelenumi}{\theenumi.}
\renewcommand{\theenumii}{\arabic{enumii}}
\renewcommand{\labelenumii}{\theenumi.\theenumii.}
\renewcommand{\p@enumii}{\theenumi.}
\renewcommand{\theenumiii}{\arabic{enumiii}}
\renewcommand{\labelenumiii}{\theenumi.\theenumii.\theenumiii.}
\renewcommand{\p@enumiii}{\theenumi.\theenumii.}
\renewcommand{\theenumiv}{\arabic{enumiv}}
\renewcommand{\labelenumiv}{\theenumi.\theenumii.\theenumiii.\theenumiv.}
\renewcommand{\p@enumiv}{\theenumi.\theenumii.\theenumiii.}

% Adequação das citações e referências a norma ABNT
\RequirePackage[alf,abnt-url-package=url]{abntcite}

\RequirePackage[nottoc,notindex,notlot,notlof,numbib]{tocbibind}

\renewenvironment{abstract}{
	\begin{minipage}[c]{\linewidth - 1cm}
	\singlespace
	\begin{center}
		\textbf{\abstractname}
	\end{center}
}{
	\end{minipage}
}
