\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-dissertation}[2007/03/23 Customized dissertation]

\LoadClass{common-book}

\RequirePackage{fancyhdr}

% Vari�veis utilizadas para criar a capa da disserta��o
% - advisor: Nome completo do(a) orientador(a)
% - fulldate: Data por extenso da entrega da disserta��o
% - dedication: Dedicat�ria
% - keywords: Palavras-chaves
\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\fulldate#1{\gdef\@fulldate{#1}}%
\def\@fulldate{\@latex@error{No \noexpand\fulldate given}\@ehc}%

\def\dedication#1{\gdef\@dedication{#1}}%
\def\@dedication{\@latex@warning{No \noexpand\dedication given}\@ehc}%

\def\keywords#1{\gdef\@keywords{#1}}%
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}%


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
				SERVI�O DE P�S-GRADUA��O DO ICMC-USP \par
				\end{footnotesize}
			\end{center}
			\vskip .5em
			Data de Dep�sito: \@fulldate \par
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
			{\hyphenpenalty=10000 Disserta��o apresentada ao Instituto de Ci�ncias Matem�ticas e de Computa��o - ICMC-USP, como parte dos requisitos para a obten��o do t�tulo de Mestre em Ci�ncias de Computa��o e Matem�tica Computacional. \par}%
		\end{minipage}
	\end{flushright}
	\vfill
	\begin{center}
		USP - S�o Carlos \par
		\@date \par
	\end{center}
	\clearpage
	\end{adjustwidth}
\end{titlepage}
}

% Traduz os nomes de listagens e fragmentos de c�digo para portugu�s
\renewcommand{\lstlistingname}{Fragmento de c�digo}
\renewcommand{\lstlistlistingname}{Lista de fragmentos de c�digo}