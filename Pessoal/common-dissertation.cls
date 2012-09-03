\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-dissertation}[2007/03/23 Customized dissertation]

\LoadClassWithOptions{book}
\RequirePackage{common-book}

\RequirePackage{fancyhdr}

\RequirePackage{pdfpages}

\RequirePackage{tocvsec2}
\maxtocdepth{subsubsection}

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%

\def\depositshortdate#1{\gdef\@depositshortdate{#1}}%
\def\@depositshortdate{\@latex@error{No \noexpand\depositshortdate given}\@ehc}%

\def\depositfulldate#1{\gdef\@depositfulldate{#1}}%
\def\@depositfulldate{\@latex@error{No \noexpand\depositfulldate given}\@ehc}%

\def\defenseshortdate#1{\gdef\@defenseshortdate{#1}}%
\def\@defenseshortdate{\@latex@error{No \noexpand\defenseshortdate given}\@ehc}%

\def\defensefulldate#1{\gdef\@defensefulldate{#1}}%
\def\@defensefulldate{\@latex@error{No \noexpand\defensefulldate given}\@ehc}%

\def\dedication#1{\gdef\@dedication{#1}}%
\def\@dedication{\@latex@warning{No \noexpand\dedication given}\@ehc}%

\def\keywords#1{\gdef\@keywords{#1}}%
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}%

\def\graduationsecretary#1{\gdef\@graduationsecretary{#1}}%
\def\@graduationsecretary{\@latex@error{No \noexpand\graduationsecretary given}\@ehc}%

\def\dissertationgoal#1{\gdef\@dissertationgoal{#1}}%
\def\@dissertationgoal{\@latex@error{No \noexpand\dissertationgoal given}\@ehc}%

\def\depositplace#1{\gdef\@depositplace{#1}}%
\def\@depositplace{\@latex@error{No \noexpand\depositplace given}\@ehc}%

\newcommand{\defensebox}{
	\begin{flushright}
		\begin{boxedminipage}[t]{6.5cm}
			\begin{center}
				\begin{footnotesize}
					\allcaps{\@graduationsecretary} \par
				\end{footnotesize}
			\end{center}
			\vskip .5em
			Data de Defesa: \@defensefulldate \par
			\vskip 1em
			Assinatura: \rule{.7\linewidth}{.05mm} \par
		\end{boxedminipage}
	\end{flushright}
}


\newcommand{\depositbox}{
	\hspace{10.3cm}
	\fbox{\begin{minipage}[t][2.85cm]{7.5cm}
		\begin{center}
			\vspace{0.15cm}
			\begin{footnotesize}
				{\fontfamily{times-ttf}\selectfont\fontsize{9pt}{11pt} \@depositplace}
			\end{footnotesize}
		\end{center}
		\vspace{0.35cm}
		{\hspace{0.15cm}\fontfamily{times-ttf}\selectfont\fontsize{12pt}{14pt} \depositdatename: \@depositfulldate \par}
		\vspace{0.4cm}
		{\hspace{0.15cm}\fontfamily{times-ttf}\selectfont\fontsize{12pt}{14pt} \signaturename: \rule{5cm}{.05mm} \par}
		\vspace{0.20cm}
	\end{minipage}}

}


\newcommand{\coverpageone}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
	\null
	\vspace{8.0cm}
	\begin{center}
		\rule{14.7cm}{.3mm}
		\begin{minipage}{10.6cm}
			\begin{center}
				\vspace{0.6cm}
				{\fontfamily{tahoma}\selectfont\fontsize{17pt}{20pt} \textsf{\@title} \par}
				% {\textbf{\fontsize{15pt}{19pt} \selectfont \normalfont \Large\sffamily\bfseries \@title}}
				\vspace{1.0cm}
				{\fontfamily{times-ttf}\selectfont\fontsize{15pt}{18pt}\textbf{\textit{\@author}} \normalsize \par}
				% {\fontsize{13pt}{6pt} \selectfont \textbf{\emph{\large\@author}}}
				\vspace{0.5cm}
			\end{center}
		\end{minipage}
		\rule{14.7cm}{.3mm}
	\end{center}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
}


\newcommand{\coverpagetwo}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
	\depositbox
	% \defensebox
	\vspace{2.6cm}
	\begin{center}
		\begin{minipage}{12cm}
			\centering
			{\fontfamily{tahoma}\selectfont\fontsize{17pt}{21pt} \textsf{\@title} \par}
		\end{minipage}
	\end{center}
	\begin{center}
		\vspace{1.2cm}
		{\fontfamily{times-ttf}\selectfont\fontsize{14pt}{17pt}\textbf{\@author} \par}
		\vspace{2.4cm}
		{\fontfamily{times-ttf}\selectfont\fontsize{12pt}{14pt}\textbf{\textit{Orientador}: \@advisor} \par}
	\end{center}
	\vspace{1.7cm}
	\begin{flushright}
		\begin{minipage}{8.5cm}
			{\fontfamily{times-ttf}\selectfont\fontsize{11pt}{13pt}\hyphenpenalty=10000 \singlespacing \@dissertationgoal \par}%
		\end{minipage}
	\end{flushright}
	\vspace{2.5cm}
	\begin{center}
		{\fontfamily{times-ttf}\selectfont\fontsize{12pt}{14pt}\bf\@address \par}
		\vspace{-0.3cm}
		{\fontfamily{times-ttf}\selectfont\fontsize{12pt}{14pt}\bf\@depositshortdate \par}
	\end{center}
	\end{adjustwidth}
	\includepdf[pages={1}]{refcard.pdf}
}

% Title and cover page
%
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\coverpageone
		\coverpagetwo
		\ifx\@dedication\@empty\else{
        		\dedicate
		}
		\fi
	\end{titlepage}
}

% Dedicate page
%
\renewcommand{\dedicate}{
	\thispagestyle{empty}
	\null
	\vfill
	\hfill \noindent\textsl{\@dedication} \hspace{1cm} \par
        \vspace{3cm}
	\clearpage{\pagestyle{empty}\cleardoublepage}
}
