\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-dissertation}[2007/03/23 Customized dissertation]

\LoadClass{book}
\RequirePackage{common-book}

\RequirePackage{fancyhdr}

\RequirePackage[alf,abnt-etal-list=2,abnt-etal-text=it,abnt-full-initials=yes,abnt-missing-year=sd,abnt-show-options=warn,abnt-doi=link,abnt-url-package=url]{abntcite}
\citeoption{abnt-etal-list=2}


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

\newcommand{\defensebox}{
	\begin{flushright}
		\begin{boxedminipage}[t]{8cm}
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
	\begin{flushright}
		\fbox{\begin{minipage}[t][2.8cm]{8cm}
			\begin{center}
				\begin{footnotesize}
					\allcaps{\@graduationsecretary}
				\end{footnotesize}
			\end{center}
			\depositdatename: \@depositfulldate \par
			\vspace{0.4cm}
			\signaturename: \rule{4.5cm}{.05mm} \par
		\end{minipage}}
	\end{flushright}
}


\newcommand{\coverpageone}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
	\null
	\vspace{10.7cm}
	\begin{center}
		\rule{11.5cm}{.3mm}
		\begin{minipage}{10.6cm}
			\begin{center}
				\vspace{0.6cm}
				{\Large \textsf{\@title} \par}
				% {\textbf{\fontsize{15pt}{19pt} \selectfont \normalfont \Large\sffamily\bfseries \@title}}
				\vspace{0.75cm}
				{\large \textbf{\textit{\@author}} \normalsize \par}
				% {\fontsize{13pt}{6pt} \selectfont \textbf{\emph{\large\@author}}}
				\vspace{0.5cm}
			\end{center}
		\end{minipage}
		\rule{11.5cm}{.3mm}
	\end{center}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
}


\newcommand{\coverpagetwo}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
	\depositbox
	% \defensebox
	\vfill
	\begin{center}
		\begin{minipage}{12cm}
			\centering
			{\LARGE \textsf{\@title} \par}
		\end{minipage}
	\end{center}
	\begin{center}
		\vspace{1.3cm}
		{\textbf{\textit{\@author}} \par}
		\vspace{1.3cm}
		{\textbf{\advisorname: \textit{\@advisor}} \par}
	\end{center}
	\vfill
	\begin{flushright}
		\begin{minipage}{11.4cm}
			{\hyphenpenalty=10000 \singlespacing \@dissertationgoal \par}%
		\end{minipage}
	\end{flushright}
	\vfill
	\begin{center}
		\@address \par
		\@depositshortdate \par
	\end{center}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
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


