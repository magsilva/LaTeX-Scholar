\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myarticle}[2006/06/21 Customized article]

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

\LoadClass{common-article}