\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myarticle}[2006/06/21 Customized article]

\RequirePackage{ifthen}
\newboolean{speciallicense}
\setboolean{speciallicense}{false}

\DeclareOption{onecolumn}{
	\PassOptionsToClass{11pt,onecolumn}{article}
}

\DeclareOption{twocolumn}{
	\PassOptionsToClass{10pt,twocolumn}{article}
}

\DeclareOption{speciallicense}{
	\setboolean{speciallicense}{true}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{oneside,a4paper}
\ProcessOptions

\LoadClass{article}

% l10n
\RequirePackage[english,brazil]{babel}

% i18n
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ae}

% Par�metros que determinam a qualidade e compress�o utilizada para os documentos PDF
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

% Defini��o do posicionamento padr�o das tabelas e figuras
\RequirePackage{float}
\restylefloat{table}
\restylefloat{figure}
\floatplacement{table}{!htb}
\floatplacement{figure}{!htb}

% Otimiza��o no espa�o ocupado por floats
\renewcommand{\floatsep}{8pt}
\renewcommand{\intextsep}{12pt}
\renewcommand{\textfloatsep}{12pt}

% Diminui o espa�o entre um float e seu caption.
\setlength{\abovecaptionskip}{4pt}

% Pacote para coordenar o posionamento de floats.
% Utilize \afterpage{\clearpage} para for�ar que todos os floats definidos at�
% aquele momento sejam inseridos.
\RequirePackage{afterpage}

% Habilitar a utiliza��o de figuras
\RequirePackage[pdftex]{graphicx}
\RequirePackage{epstopdf}

\RequirePackage[obeyspaces]{url}

% Altera��o das margens das p�ginas
\RequirePackage[pdftex]{geometry}
\geometry{a4paper,left=2.5cm,right=2cm,top=2cm,bottom=3.5cm}

% Configura��o do espa�amento entre linhas (1,5)
\RequirePackage{setspace}
\onehalfspace


% Lista de acr�nimos
\RequirePackage[printonlyused]{acronym}

% Macro para zerar os par�metros relacionados a espa�amento vertical.
% Originalmente este c�digo pertencia ao FAQ franc�s sobre LaTeX.
\def\Nospacing{
	\itemsep=0pt
	\partopsep=0pt
	\parskip=0pt
	\parsep=0pt
}

\def\email#1{\gdef\@email{#1}}%
\def\@email{\@latex@error{No \noexpand\email given}\@ehc}%

\def\license#1{\gdef\@license{#1}}%
\def\@license{\@latex@error{No \noexpand\license given}\@ehc}%

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


% Redifini��o do ambiente description para diminuir o espa�amento entre os itens. Uma solu��o mais
% elegante seria aquela adotada para itemize e enumerate nesta mesmo classe, mas ela n�o funciona
% (talvez esteja relacionado ao fato do description ser redefinido na classe book).
\renewenvironment{description}{
	\list{}{
		\Nospacing
		\let\makelabel\descriptionlabel}
	}
	{\endlist}

% Redefini��o do r�tulo de item em description, igual ao do book com exce��o
% dos ":" agoraadicionado no final do r�tulo.
\renewcommand*\descriptionlabel[1]{
	\hspace
	\labelsep
	\normalfont
	\bfseries #1:
}

% Redefini��o dos ambientes itemize e enumerate, corrigindo o espa�amento entre
% os itens. C�digo retirado do FAQ franc�s sobre LaTeX.
\let\orig@Itemize =\itemize
\let\orig@Enumerate =\enumerate
\renewenvironment{itemize}{\orig@Itemize\Nospacing}{\endlist}
\renewenvironment{enumerate}{\orig@Enumerate\Nospacing}{\endlist}

% Redefini�ao do ambiente utilizado pela lista de acr�nimos, corrigindo o espa�amento
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

% Impede a hifeniza��o do conte�do definido na macro \srccode.
\RequirePackage{hyphenat}

% Macro utilizada para termos em ingl�s.
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}

% Macro utilizada para trechos de c�digo-fonte inseridos no meio do texto.
\newcommand\srccode[1]{\url{#1}}
% \newcommand\srccode[1]{\foreignlanguage{english}{\textnhtt{\small{#1}}}}


% Utilizado para listagens de c�digo-fonte
\RequirePackage{textcomp} % Required by upquote option.
\RequirePackage{listings}

% Traduz os nomes de listagens e fragmentos de c�digo para portugu�s
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
\lstset{captionpos=b}
\lstset{extendedchars=true}
\lstset{upquote=true}


% Resolve um warning do latex.
\setlength{\headheight}{16pt}

% Ambiente para cita��es diretas.
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

% Ambiente para defini��es importantes (termos chaves).
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

% Altera a numera��o do enumerate para 1.1, 1.2.1, etc (sempre n�meros ar�bicos).
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

% Adequa��o das cita��es e refer�ncias a norma ABNT
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


\newcommand{\printlicense}{
	\ifthenelse{\boolean{speciallicense}}{
		\let\origfootnote=\thefootnote
		\def\thefootnote{\relax}
		\footnotetext{\hspace{-1.8em}Copyright \copyright\  \number\year \  \@author. Este trabalho � disponibilizado de acordo com os termos da licen�a \@license.}
		\def\thefootnote{\origfootnote}
	}{
		\footnotetext{\hspace{-1.8em}Copyright \copyright\  \number\year \  \@author.}
	}
}